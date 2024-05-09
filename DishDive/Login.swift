//
//  Login.swift
//  DishDive
//
//  Created by David Nguyen on 5/1/24.
//

import SwiftUI


struct LoginView: View {
    @State private var userName = ""
    @State private var passWord = ""
    
    var body: some View {
        NavigationView{
            GeometryReader { geometry in
                VStack{
                    Spacer()
                    Image("DishDive")
                        .frame(width: 100, height: 200)
                        .scaledToFit()
                    Text("Login")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(alignment: .center)
                        .padding()
                    TextField("Username", text: $userName)
                        .padding()
                        .autocapitalization(.none)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .cornerRadius(5)
                        .background(Color("off-white"))
                        .frame(alignment: .center)
                    TextField("Password", text: $passWord)
                        .padding()
                        .autocapitalization(.none)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .cornerRadius(5)
                        .background(Color("off-white"))
                        .frame(alignment: .center)
                    Button(action: {
                        // TODO: Perform Login logic here
                        print("Login button tapped")
                    }) {
                        Text("Login")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding()
                    NavigationLink( destination: RegisterView()) {
                        Text("Don't have an account? Register here.")
                            .font(.caption)
                            .foregroundColor(.blue)
                    }
                    Spacer()
                    
                }
                .frame(alignment: .center)
                .padding()
            }
        }
    }
}

#Preview {
    LoginView()
}
