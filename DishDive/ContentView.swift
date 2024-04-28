//
//  ContentView.swift
//  DishDive
//
//  Created by David Nguyen on 4/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Int = 1 // Set the initial selection to the tag value of the HomeView
    
    var body: some View {
        NavigationView {
            TabView(selection: $selection) {
                ProfileView()
                    .tag(0)
                HomeView()
                    .tag(1)
                FavoritesView()
                    .tag(2)
            }
        }
    }
}

#Preview {
    ContentView()
}
