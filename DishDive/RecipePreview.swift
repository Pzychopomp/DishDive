//
//  RecipePreview.swift
//  DishDive
//
//  Created by David Nguyen on 4/29/24.
//

import SwiftUI
import URLImage
import FirebaseFirestore

struct Recipe: Identifiable {
    var id: String
    var recipeName: String
    var imageURL: String
    var isFavorite: Bool
    var accountID: String
}



// Item View
struct RecipeBoxView: View {
    var recipe: Recipe

    var body: some View {
        VStack {
            if let url = URL(string: recipe.imageURL) {
                URLImage(url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150)
                        .cornerRadius(10)
                        .clipped()
                }
            } else {
                Rectangle()
                    .fill(Color.secondary.opacity(0.3))
                    .frame(width: 150, height: 150)
                    .cornerRadius(10)
                Text("Invalid URL")
            }
            
            Text(recipe.recipeName)
                .font(.caption)
        }
    }
}


// Grab Data from Db
// RecipeViewModel to fetch and manage recipe data
class RecipeViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    private var db = Firestore.firestore()

    func loadRecipesFromFirestore() {
        db.collection("recipes").getDocuments { (snapshot, error) in
            if let error = error {
                print("Error getting recipes: \(error)")
                return
            }
            guard let documents = snapshot?.documents else {
                print("No documents in 'recipes' collection")
                return
            }
            self.recipes = documents.map { doc -> Recipe in
                let data = doc.data()
                let id = doc.documentID
                let recipeName = data["recipeName"] as? String ?? ""
                let imageURL = data["imageURL"] as? String ?? ""
                let isFavorite = data["isFavorite"] as? Bool ?? false
                let accountID = data["accountID"] as? String ?? ""
                
                return Recipe(id: id, recipeName: recipeName, imageURL: imageURL, isFavorite: isFavorite, accountID: accountID)
            }
        }
    }
}
