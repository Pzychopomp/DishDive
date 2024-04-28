//
//  HomeView.swift
//  DishDive
//
//  Created by David Nguyen on 4/27/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
                HStack(spacing: 20) {
                    // Plus Button
                    NavigationLink(destination: AddRecipe()) {
                        Image(systemName: "plus")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .foregroundColor(.black)
                            .padding(10) // Padding inside the button
                            .frame(width: 50, height: 30) // Size of the button
                            .cornerRadius(10) // Rounded corners
                    }

                    // Search Button
                    Button(action: {
                        // TODO: Code to filter by name
                        // Action to perform when the search button is tapped
                    }) {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .foregroundColor(.black)
                            .padding(10) // Padding inside the button
                            .frame(width: 50, height: 30) // Size of the button
                            .cornerRadius(10) // Rounded corners
                    }
                    .padding(.trailing, 10)
                }
            }
            // New TabView inside HomeView
            TabView {
                Text("Dishes").tabItem {
                    Text("American")
                        .fontWeight(.bold)
                }
                .font(.title)
                .fontWeight(.bold)
                .frame(alignment: .center)
                .padding()
                Text("Dishes").tabItem {
                    Text("Asian")
                        .fontWeight(.bold)
                }
                .font(.title)
                .fontWeight(.bold)
                .frame(alignment: .center)
                .padding()
                Text("Dishes").tabItem {
                    Text("Mexican")
                        .fontWeight(.bold)
                }
                .font(.title)
                .fontWeight(.bold)
                .frame(alignment: .center)
                .padding()
            }
            .frame(height: 70)

            // Existing content of HomeView
            GeometryReader { _ in
                NavigationView {
                    VStack {
                        // Code for list and feed below
                        ScrollView {
                            // TODO: Content for Images from db + make ImageView
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding()
                        .background(Color.gray)
                        .cornerRadius(2)
                    }
                }
            }
        }

        // No Touch
        .tabItem {
            Label("Home", systemImage: "house")
        }
    }
}
