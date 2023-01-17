//
//  ContentView.swift
//  ModalsInSwiftUI
//
//  Created by Anton Sergeyev on 13.01.2023.
//

import SwiftUI
import Notifications

class NotificationManager: ObservableObject {
    @Published var value: Any?
}

struct ContentView: View {
    @StateObject private var notificationManager = NotificationManager()

    var body: some View {
        NotificationView($notificationManager.value) {
            NavigationStack {
                FruitListView()
            }
        }
        .environmentObject(notificationManager)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
