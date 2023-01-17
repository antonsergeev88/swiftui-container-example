import SwiftUI

private struct Fruit: Hashable {
    let emoji: String
    let name: String

    static let allFruits: [Fruit] = [
        .init(emoji: "🍇", name: "Grape"),
        .init(emoji: "🍈", name: "Melon"),
        .init(emoji: "🍉", name: "Watermelon"),
        .init(emoji: "🍊", name: "Tangerine"),
        .init(emoji: "🍋", name: "Lemon"),
        .init(emoji: "🍌", name: "Banana"),
        .init(emoji: "🍍", name: "Pineapple"),
        .init(emoji: "🥭", name: "Mango"),
    ]
}

struct FruitListView: View {
    @EnvironmentObject var notificationManager: NotificationManager

    var body: some View {
        List {
            ForEach(Fruit.allFruits, id: \.emoji) { fruit in
                Button(fruit.name) {
                    notificationManager.value = fruit
                }
            }
        }
        .foregroundColor(.primary)
        .navigationTitle("Fruits")
        .notification(for: Fruit.self) { fruit in
            VStack(spacing: 20) {
                Text(fruit.emoji)
                    .font(.largeTitle)
                Text(fruit.name)
            }
            .padding(80)
            .background {
                Color.gray.opacity(0.6)
            }
            .cornerRadius(20)
        }
    }
}

struct FruitListView_Previews: PreviewProvider {
    static var previews: some View {
        FruitListView()
            .environmentObject(NotificationManager())
    }
}
