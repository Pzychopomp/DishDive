//
//  ProfileView.swift
//  DishDive
//
//  Created by David Nguyen on 4/27/24.
//

import SwiftUI
import Firebase

struct Account {
    var userName: String
    var profilePic: String
    var bio: String
}

class AccountViewModel: ObservableObject {
    @Published var account: Account?
    @Published var isLoading: Bool = false
    @Published var error: String?

    func fetchAccount() {
        guard let user = Auth.auth().currentUser else {
            self.error = "No user is logged in"
            return
        }
        self.isLoading = true

        // Simulating an asynchronous fetch operation
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.isLoading = false
            let userName = user.displayName ?? "No Username"
            let profilePic = user.photoURL?.absoluteString ?? "https://example.com/default-profile-pic.jpg"
            let bio = "This is a bio placeholder. Update me in settings."
            let fetchedAccount = Account(userName: userName, profilePic: profilePic, bio: bio)
            self.account = fetchedAccount
        }
    }
}

struct ProfileView: View {
    @StateObject var viewModel = AccountViewModel()

    var body: some View {
        VStack {
            HStack(spacing: 20) {
                NavigationLink(destination: LoginView()) {
                    Text("Login")
                        .foregroundColor(.white)  // Ensure text color contrasts well with the light blue background
                        .padding(10)  // Comfortable padding inside the button
                }
                .frame(width: 80, height: 40)  // Define a standard button size
                .background(Color(red: 0.67, green: 0.84, blue: 0.90))  // Specific light blue color
                .cornerRadius(10)  // Moderately rounded corners for a soft but traditional button look
                .shadow(radius: 2)  // Optional: adds a slight shadow for depth
            }
            
            Text("Profile")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            if viewModel.isLoading {
                ProgressView()
            } else if let account = viewModel.account {
                VStack {
                    AsyncImage(url: URL(string: account.profilePic)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                    } placeholder: {
                        Circle()
                            .fill(Color.gray)
                            .frame(width: 100, height: 100)
                    }
                    
                    Text(account.userName)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding()
                    
                    VStack(alignment: .leading) {
                        Text("Bio")
                            .font(.title3)
                            .fontWeight(.bold)
                        Text(account.bio)
                            .padding()
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color("off-white"))
                    .cornerRadius(5)
                }
            } else {
                // Optional: Add text or another view to handle the case where there is no account data yet
                Text("No profile data available.")
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .onAppear {
            viewModel.fetchAccount()
        }
        .tabItem {
                    Label("Profile", systemImage: "person.fill")  // Ensure this name is correctly typed
                }
    }
}

#Preview {
    ProfileView()
}
