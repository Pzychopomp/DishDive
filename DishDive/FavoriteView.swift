//
//  FavoriteView.swift
//  DishDive
//
//  Created by David Nguyen on 4/27/24.
//

import SwiftUI

struct FavoritesView: View {
    @ObservedObject var viewModel: RecipeViewModel
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        NavigationView {
            VStack {
                Text("Favorites") // Title for the favorites page
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()

                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        // Populate with favorited items
                        ForEach(viewModel.recipes.filter { $0.isFavorite }) { recipe in
                            RecipeBoxView(recipe: recipe)
                                .padding()
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
                .background(Color("off-white"))
                .cornerRadius(2)
            }
            .navigationBarHidden(true) // Hide the navigation bar added by NavigationView
            
        }
        .tabItem {
            Label("Favorites", systemImage: "heart")
        }
    }
}
