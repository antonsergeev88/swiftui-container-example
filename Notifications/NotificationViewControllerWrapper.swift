import SwiftUI

struct NotificationViewControllerWrapper<Content: View>: UIViewControllerRepresentable {
    class Coordinator {
        let registry = NotificationRegistry()
    }

    private let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
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

    }
}
