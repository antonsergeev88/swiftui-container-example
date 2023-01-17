import UIKit

class NotificationViewController: UIViewController {
    private let content: UIViewController
    private var notificationController: UIViewController?
    private var size = CGSize.zero

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

    func removeNotification() {
        if let notificationController {
            notificationController.willMove(toParent: nil)
            UIView.animate(withDuration: 0.25) {
                notificationController.view.alpha = 0
            } completion: { _ in
                notificationController.view.removeFromSuperview()
                notificationController.removeFromParent()
                if self.notificationController === notificationController {
                    self.notificationController = nil
                }
            }
        }
    }

    func showNotification(_ viewController: UIViewController, size: CGSize) {
        addChild(viewController)
        view.addSubview(viewController.view)
        viewController.view.backgroundColor = .clear
        viewController.view.isUserInteractionEnabled = false
        viewController.view.bounds = CGRect(origin: .zero, size: size)
        viewController.view.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        viewController.view.center = CGPoint(x: view.bounds.midX, y: view.bounds.midY)

        if let notificationController {
            notificationController.willMove(toParent: nil)
            notificationController.view.removeFromSuperview()
            notificationController.removeFromParent()
            viewController.didMove(toParent: self)
        } else {
            viewController.view.alpha = 0
            UIView.animate(withDuration: 0.25) {
                viewController.view.alpha = 1
            } completion: { _ in
                viewController.didMove(toParent: self)
            }
        }
        self.notificationController = viewController
    }
}
