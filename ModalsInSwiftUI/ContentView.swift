//
//  ContentView.swift
//  ModalsInSwiftUI
//
//  Created by Anton Sergeyev on 13.01.2023.
//

import SwiftUI
import Notifications

struct ContentView: View {
    var body: some View {
        NotificationView {
            NavigationStack {
                FruitListView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
