//
//  Login.swift
//  DishDive
//
//  Created by David Nguyen on 5/1/24.
//

import SwiftUI
import Firebase

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var loginErrorMessage: String? // To display any login error messages
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    Image("DishDive")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                    Text("Login")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                    TextField("Email", text: $email)
                        .padding()
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .cornerRadius(5)
                        .background(Color("white"))
                    SecureField("Password", text: $password)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .cornerRadius(5)
                        .background(Color("white"))
                    if let errorMessage = loginErrorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .padding()
                    }
                    Button(action: loginUser) {
                        Text("Login")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding()
                    NavigationLink(destination: RegisterView()) {
                        Text("Don't have an account? Register here.")
                            .font(.caption)
                            .foregroundColor(.blue)
                    }
                    Spacer()
                }
                .padding()
            }
        }
    }

    private func loginUser() {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                // An error occurred during login
                self.loginErrorMessage = "Login failed: \(error.localizedDescription)"
            } else {
                // Login successful, navigate to the main part of your application
                print("Login successful")
                // You can use an environment object, a global view model, or notifications to change the view
            }
        }
    }
}
