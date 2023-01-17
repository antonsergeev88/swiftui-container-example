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
        .notification(for: Fruit.self) { fruit in
            VStack(spacing: 20) {
                Text(fruit.emoji)
                Text(fruit.name)
            }
            .padding(40)
            .background {
                Color.blue
            }
            .cornerRadius(20)
        }
        .notification(for: Int.self) { i in
            Text("\(i)")
                .padding(40)
                .background {
                    Color.red
                }
                .cornerRadius(10)
        }
    }
}

struct FruitListView_Previews: PreviewProvider {
    static var previews: some View {
        FruitListView()
    }
}
