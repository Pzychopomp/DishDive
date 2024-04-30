//
//  RecipePreview.swift
//  DishDive
//
//  Created by David Nguyen on 4/29/24.
//

import SwiftUI
import URLImage
import Combine

// Data model to be used by db and to check
struct Recipe: Identifiable{
    var id = UUID()
    var name: String
    var picURL: String // Change the type to URL
    var isFavorite: Bool
}

// Item View
struct RecipeBoxView: View {
    var recipe: Recipe
    @State private var isFavorite: Bool

    init(recipe: Recipe) {
        self.recipe = recipe
        _isFavorite = State(initialValue: recipe.isFavorite)
    }

    var body: some View {
        VStack {
            ZStack(alignment: .topTrailing) {
                if let url = URL(string: recipe.picURL) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 150) // Square frame
                            .cornerRadius(10)
                    } placeholder: {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                    }
                } else {
                    // Handle invalid URL
                    Text("Invalid URL")
                }

                Button(action: {
                    isFavorite.toggle()
                }) {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .foregroundColor(isFavorite ? .red : .gray)
                        .padding([.top, .trailing], 10)
                }
            }

            Text(recipe.name) // Display the name
                .font(.caption)
        }
    }
}


// Grab Data from Db
// RecipeViewModel to fetch and manage recipe data
class RecipeViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []

    init() {
        loadItems()
    }

    func loadItems() {
        // Your data fetching logic here
        // This example uses static data
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            // Example using URLImage to load images from URLs
            //TODO: Change to use data from Mongo
            self.recipes = [
                Recipe(name: "Cupcake", picURL: String("https://sugarspunrun.com/wp-content/uploads/2022/04/Best-Chocolate-Cupcakes-1-of-1.jpg"), isFavorite: false),
                Recipe(name: "Pizza", picURL: String("https://media.istockphoto.com/id/1377372234/photo/pizza-with-salami-bell-pepper-tomatoes-and-cheese-pickles-bacon-and-sausages-on-a-light.jpg?s=1024x1024&w=is&k=20&c=w42_pOFEXNNtcZ9iF0dPYXfXzuXOcKOLfWmItCnzRAg="), isFavorite: true),
                Recipe(name: "Burger", picURL: String("https://t4.ftcdn.net/jpg/02/74/99/01/360_F_274990113_ffVRBygLkLCZAATF9lWymzE6bItMVuH1.jpg"), isFavorite: false)
            ]
        }
    }
}
