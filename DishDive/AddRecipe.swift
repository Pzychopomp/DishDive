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
        GeometryReader { geometry in
            VStack {
                VStack {
                    HStack {
                        Text("Recipe Name")
                            .frame(alignment: .leading)
                        Spacer()
                    }
                    Text("Input")
                        .frame(width: geometry.size.width/1.2, height: geometry.size.height/25)
                        .background(Color.indigo)
                        .cornerRadius(7)
                }
                Spacer()
                VStack {
                    HStack {
                        Text("Ingredients")
                            .frame(alignment: .leading)
                        Spacer()
                    }
                    Text("Input")
                        .frame(width: geometry.size.width/1.2, height: geometry.size.height/4.5, alignment: .center)
                        .background(Color.indigo)
                        .cornerRadius(7)
                }
                Spacer()
                VStack {
                    HStack {
                        Text("Steps")
                            .frame(alignment: .leading)
                        Spacer()
                    }
                    ScrollView {
                        Text("Step 1")
                    }
                    .frame(width: geometry.size.width/1.2, height: geometry.size.height/2.5, alignment: .center)
                    .background(Color.indigo)
                    .cornerRadius(7)
                }
                Spacer()
                Button("Done") {
                    self.presentationMode.wrappedValue.dismiss()
                }
                .bold()
                .padding(10) // Padding inside the link
                .frame(width: geometry.size.width/1.5, height: geometry.size.height/10, alignment: .center)
                .background(Color.black) // Background color of the button
                .cornerRadius(10) // Rounded corners
                Spacer()
            }
            .padding()
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
            .background(Color.gray)
            .cornerRadius(15)
        }
        .padding()
    }
}
