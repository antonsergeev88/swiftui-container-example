import SwiftUI

public struct NotificationView<Root: View>: View {
    private let root: () -> Root

    public init(@ViewBuilder root: @escaping () -> Root) {
        self.root = root
    }

    public var body: some View {
        NotificationViewControllerWrapper(content: root)
            .ignoresSafeArea()
    }
}
