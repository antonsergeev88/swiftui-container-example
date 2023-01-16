//
//  ContentView.swift
//  ModalsInSwiftUI
//
//  Created by Anton Sergeyev on 13.01.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NotificationView {
            NavigationStack {
                FruitListView()
            }
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
