//
//  ContentView.swift
//  DishDive
//
//  Created by David Nguyen on 4/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ProfileView()
            HomeView()
            FavoritesView()
        }
    }
}



#Preview {
    ContentView()
}
