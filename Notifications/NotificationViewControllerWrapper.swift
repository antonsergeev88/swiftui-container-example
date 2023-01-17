import SwiftUI

struct NotificationViewControllerWrapper<Content: View>: UIViewControllerRepresentable {
    class Coordinator {
        let registry = NotificationRegistry()
    }

    private let content: Content
    private var value: Binding<Any?>

    init(_ value: Binding<Any?>, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.value = value
    }

    func makeCoordinator() -> Coordinator {
        .init()
    }

    func makeUIViewController(context: Context) -> NotificationViewController {
        let content = self.content
            .environment(\.notificationRegistry, context.coordinator.registry)
        let contentController = UIHostingController(rootView: content)
        let controller = NotificationViewController(content: contentController)
        return controller
    }

    func updateUIViewController(_ uiViewController: NotificationViewController, context: Context) {
        if let value = value.wrappedValue, let view = context.coordinator.registry.view(for: value) {
            let notificationViewController = UIHostingController(rootView: view)
            let size = notificationViewController.sizeThatFits(in: uiViewController.view.bounds.insetBy(dx: 20, dy: 100).size)
            uiViewController.showNotification(notificationViewController, size: size)
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
                self.value.wrappedValue = nil
            }
        } else {
            uiViewController.removeNotification()
        }
    }
}
