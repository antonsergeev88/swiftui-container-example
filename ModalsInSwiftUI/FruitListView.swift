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
    var body: some View {
        List {
            ForEach(Fruit.allFruits, id: \.emoji) { fruit in
                Button(fruit.name) {
                    
                }
            }
        }
        .navigationTitle("Fruits")
    }
}
