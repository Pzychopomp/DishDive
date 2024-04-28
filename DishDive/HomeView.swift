//
//  HomeView.swift
//  DishDive
//
//  Created by David Nguyen on 4/27/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                VStack {
                    // Top row
                    // TODO: Fix layout to fill top area + find better font.
                    HStack {
                        Image("DishDive")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                        Spacer()
                        // DONE: AddRecipe button
                        NavigationLink(destination: AddRecipe()) {
                            Text("Add RECIPE")
                                .bold()
                        }
                        .padding(10) // Padding inside the link
                        .frame(width: 150, height: 70) // Size of the clickable area
                        .background(Color.gray) // Background color of the button
                        .cornerRadius(10) // Rounded corners
                    }
                    // Code for list and feed below
                    ScrollView {
                        // Your content here
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(1)
                }
            }
        }
        .tabItem {
            Label("Home", systemImage: "house")
                .padding(.horizontal) // Add padding to center the label
        }
    }
}
