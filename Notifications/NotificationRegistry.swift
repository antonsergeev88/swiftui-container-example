import SwiftUI

class NotificationRegistry {
    private var storage = [String: (Any) -> AnyView]()

    func register<T, Content: View>(for type: T.Type, content: @escaping (T) -> Content) {
        let key = String(reflecting: type)
        let value: (Any) -> _ = {
            AnyView(content($0 as! T))
        }
        storage[key] = value
    }

    func unregister<T>(_ type: T.Type) {
        let key = String(reflecting: type)
        storage[key] = nil
    }

    func view(for value: Any) -> AnyView? {
        let key = String(reflecting: type(of: value))
        guard let factory = storage[key] else {
            return nil
        }
        return factory(value)
    }
}

struct RegistryModifier<T, Note: View>: ViewModifier {
    @Environment(\.notificationRegistry) var registry

    let note: (T) -> Note

    func body(content: Content) -> some View {
        content
            .onAppear {
                registry?.register(for: T.self, content: note)
            }
            .onDisappear {
                registry?.unregister(T.self)
            }
    }
}

extension View {
    public func notification<T, Content: View>(for type: T.Type, @ViewBuilder content: @escaping (T) -> Content) -> some View {
        modifier(RegistryModifier(note: content))
    }
}

private struct NotificationRegistryEnvironmentKey: EnvironmentKey {
    static let defaultValue: NotificationRegistry? = nil
}

extension EnvironmentValues {
    var notificationRegistry: NotificationRegistry? {
        get { self[NotificationRegistryEnvironmentKey.self] }
        set { self[NotificationRegistryEnvironmentKey.self] = newValue }
    }
}
