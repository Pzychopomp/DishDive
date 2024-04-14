//
//  ContentView.swift
//  DishDive
//
//  Created by David Nguyen on 4/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            GeometryReader { _ in
                VStack {
                    // Top row
                    // TODO: Fix layout to fill top area + find better font.
                    HStack {
                        Image("DishDive")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                        // TODO: Add code to display DISHDIVE with way to display as users name(maybe)
                        VStack {
                            Text("DishDive")
                            Text("NAME")
                        }
                        Spacer()
                        // DONE: AddRecipe button
                        NavigationLink(destination: AddRecipe()) {
                            Image(systemName: "plus.circle")
                                .imageScale(.large)
                                .foregroundColor(.black)
                        }
                        .padding(10) // Padding inside the link
                        .frame(width: 100, height: 50) // Size of the clickable area
                        .background(Color.gray) // Background color of the button
                        .cornerRadius(10) // Rounded corners
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing) // Align the HStack to the trailing edge
                    .padding(.top, 50) // Add top padding to the HStack
                    // Code for list and feed below
                    HStack(spacing: 30){
                        // TODO: Add 2 containers, one on left to go between recipes and another on right to display contents
                        VStack {
                            Text("Recipes")
                                .padding(3)
                                .background(Color.white)
                                .cornerRadius(5)
                            ScrollView{
                                // TODO: Link area to text file or database
                            }
                            Spacer()
                            Text("Share")
                        }
                        .padding()
                        .background(Color.gray)
                        .cornerRadius(5)
                        // Stuff inside big block
                        // TODO: Fix layout of items inside block
                        VStack {
                            HStack{
                                Text("Recipe:")
                                Text("Output")
                            }
                            HStack{
                                Text("Ingredients:")
                                VStack{
                                    //
                                    Text("Item 1")
                                    Text("Item 2")
                                }
                            }
                            HStack{
                                Text("Steps:")
                                VStack{
                                    Text("Step 1")
                                    Text("Step 2")
                                }
                            }
                        }
                        .frame(width: 200, height: 535)
                        .padding()
                        .background(Color.gray)
                        .cornerRadius(10)
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
