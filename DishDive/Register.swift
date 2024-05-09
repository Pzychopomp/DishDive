//
//  Register.swift
//  DishDive
//
//  Created by David Nguyen on 5/6/24.
//

import SwiftUI
import Firebase

struct RegisterView: View {
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var registrationErrorMessage: String?

    var body: some View {
        VStack {
            Text("Register")
                .font(.title)
                .fontWeight(.bold)
                .padding()

            TextField("Username", text: $username)
                .padding()
                .autocapitalization(.none)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .background(Color("off-white"))

            TextField("Email", text: $email)
                .padding()
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .background(Color("off-white"))

            SecureField("Password", text: $password)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .background(Color("off-white"))

            SecureField("Confirm Password", text: $confirmPassword)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .background(Color("off-white"))

            if let errorMessage = registrationErrorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }

            Button(action: registerUser) {
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
    }

    private func registerUser() {
        // Check if the passwords match
        guard password == confirmPassword else {
            registrationErrorMessage = "Passwords do not match."
            return
        }

        // Register the user with Firebase Authentication
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                // An error happened
                registrationErrorMessage = "Registration failed: \(error.localizedDescription)"
            } else {
                // User was created successfully, now store the username
                if let user = authResult?.user {
                    let changeRequest = user.createProfileChangeRequest()
                    changeRequest.displayName = username
                    changeRequest.commitChanges { error in
                        if let error = error {
                            registrationErrorMessage = "Failed to set username: \(error.localizedDescription)"
                        } else {
                            print("User \(username) was registered successfully")
                        }
                    }
                }
            }
        }
    }
}
