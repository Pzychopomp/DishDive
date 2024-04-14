//
//  AddRecipe.swift
//  DishDive
//
//  Created by David Nguyen on 4/10/24.
//

import SwiftUI

struct AddRecipe: View {
    var body: some View {
        GeometryReader { _ in
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
        }
        .padding()
        .frame(width: 350, height: 740)
        .background(Color.gray)
        .cornerRadius(15)
    }
}
