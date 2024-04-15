//
//  AddRecipe.swift
//  DishDive
//
//  Created by David Nguyen on 4/10/24.
//

import SwiftUI

struct AddRecipe: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        GeometryReader { _ in
            VStack{
                HStack{
                    Spacer()
                    Button("Done") {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    .padding(10) // Padding inside the link
                    .frame(width: 100, height: 50) // Size of the clickable area
                    .background(Color.gray) // Background color of the button
                    .cornerRadius(10) // Rounded corners
                }
                VStack{
                    HStack{
                        Text("Recipe Name")
                            .frame(width:130, height: 20)
                        Spacer()
                        Text("Input")
                            .frame(width:180, height: 20)
                            .background(Color.indigo)
                            .cornerRadius(7)
                    }
                    Spacer()
                    HStack{
                        Text("Ingredients")
                            .frame(width:130, height: 20)
                        Spacer()
                        Text("Input")
                            .frame(width:180, height: 250)
                            .background(Color.indigo)
                            .cornerRadius(7)
                    }
                    Spacer()
                    HStack{
                        Text("Steps")
                            .frame(width:130, height: 20)
                        Spacer()
                        ScrollView{
                            Text("Step 1")
                        }
                        .frame(width:180, height: 400)
                        .background(Color.indigo)
                        .cornerRadius(7)
                    }
                }
                .padding()
                .frame(width: 350, height: 640)
                .background(Color.gray)
                .cornerRadius(15)
            }
        }
    }
}
