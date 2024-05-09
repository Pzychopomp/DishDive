//
//  Register.swift
//  DishDive
//
//  Created by David Nguyen on 5/6/24.
//

import SwiftUI

struct RegisterView: View {
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    var body: some View {
        VStack {
            Text("Register")
                .font(.title)
                .fontWeight(.bold)
                .frame(alignment: .center)
                .padding()
            TextField("Username", text: $username)
                .padding()
                .autocapitalization(.none)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .cornerRadius(5)
                .background(Color("off-white"))
                .frame(alignment: .center)
            
            TextField("Email", text: $email)
                .padding()
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .cornerRadius(5)
                .background(Color("off-white"))
                .frame(alignment: .center)
            
            SecureField("Password", text: $password)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .cornerRadius(5)
                .background(Color("off-white"))
                .frame(alignment: .center)
            
            SecureField("Confirm Password", text: $confirmPassword)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .cornerRadius(5)
                .background(Color("off-white"))
                .frame(alignment: .center)
            
            Button(action: {
                // TODO: Perform registration logic here
                print("Register button tapped")
            }) {
                Text("Register")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
            
            Spacer()
        }
        .padding()
        .navigationBarTitle("Register")
    }
}
