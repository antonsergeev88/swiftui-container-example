import SwiftUI

public struct NotificationView<Root: View>: View {
    private var value: Binding<Any?>
    private let root: () -> Root

    public init(_ value: Binding<Any?>, @ViewBuilder root: @escaping () -> Root) {
        self.value = value
        self.root = root
    }

    public var body: some View {
        NotificationViewControllerWrapper(value, content: root)
            .ignoresSafeArea()
    }
}
