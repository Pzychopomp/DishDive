//
//  FavoriteView.swift
//  DishDive
//
//  Created by David Nguyen on 4/27/24.
//

import SwiftUI

struct FavoritesView: View {
    var body: some View {
        Text("Favorites View")
            .tabItem {
                Label("Favorites", systemImage: "heart")
            }
    }
}

