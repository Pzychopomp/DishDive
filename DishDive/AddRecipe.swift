//
//  AddRecipe.swift
//  DishDive
//
//  Created by David Nguyen on 4/10/24.
//

import SwiftUI

struct AddRecipe: View {
    @Environment(\.presentationMode) var presentationMode
    
    // Example state properties for input fields
    @State private var recipeName = ""
    @State private var shortDescription = ""
    @State private var cookingTime = ""
    @State private var servingSize = ""
    @State private var ingredients = ""
    @State private var steps = ""
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    // Recipe Name
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Recipe Name")
                        TextField("Enter recipe name", text: $recipeName)
                            .textFieldStyle(.roundedBorder)
                            .frame(width: geometry.size.width / 1.2)
                            .background(Color.white)
                            .cornerRadius(5)
                    }
                    
                    // Short Description
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Short Description")
                        TextField("Enter a short description", text: $shortDescription)
                            .textFieldStyle(.roundedBorder)
                            .frame(width: geometry.size.width / 1.2)
                            .background(Color.white)
                            .cornerRadius(5)
                    }
                    
                    // Time to Cook + Serving Size
                    HStack(spacing: 20) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Cooking Time")
                            TextField("E.g., 30 minutes", text: $cookingTime)
                                .textFieldStyle(.roundedBorder)
                                .frame(width: geometry.size.width / 2.6)
                                .background(Color.white)
                                .cornerRadius(5)
                        }
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Serving Size")
                            TextField("E.g., 4 servings", text: $servingSize)
                                .textFieldStyle(.roundedBorder)
                                .frame(width: geometry.size.width / 2.6)
                                .background(Color.white)
                                .cornerRadius(5)
                        }
                    }
                    
                    // Ingredients
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Ingredients")
                        TextEditor(text: $ingredients)
                            .frame(width: geometry.size.width / 1.2, height: geometry.size.height / 4.5)
                            .background(Color.white)
                            .cornerRadius(5)
                    }
                    
                    // Steps
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Steps")
                        TextEditor(text: $steps)
                            .frame(width: geometry.size.width / 1.2, height: geometry.size.height / 2.5)
                            .background(Color.white)
                            .cornerRadius(5)
                    }
                    
                    // Done
                    Button("Done") {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    .bold()
                    .padding(10)
                    .frame(width: geometry.size.width / 4, height: geometry.size.height / 12, alignment: .center)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding()
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
            .background(Color.gray)
            .cornerRadius(2)
        }
    }
}

