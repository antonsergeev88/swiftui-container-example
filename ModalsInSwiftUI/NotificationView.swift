import SwiftUI

struct NotificationView<Content: View>: UIViewControllerRepresentable {
    private let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    func makeUIViewController(context: Context) -> NotificationViewController {
        let contentController = UIHostingController(rootView: content)
        let controller = NotificationViewController(content: contentController)
        return controller
    }

    func updateUIViewController(_ uiViewController: NotificationViewController, context: Context) {

    }
}

class NotificationViewController: UIViewController {
    private let content: UIViewController

    init(content: UIViewController) {
        self.content = content
        super.init(nibName: nil, bundle: nil)
        addChild(content)
        content.didMove(toParent: self)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = UIView()
        view.addSubview(content.view)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        content.view.frame = view.bounds
    }
}
