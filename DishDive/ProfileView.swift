//
//  ProfileView.swift
//  DishDive
//
//  Created by David Nguyen on 4/27/24.
//

import SwiftUI

struct Account {
    var userName: String // Primary Key
    var password: String
    var profilePic: String
    var bio: String
    // Add email verification later
}

class AccountViewModel: ObservableObject {
    @Published var account: Account?
    // Other state properties (e.g., loading state, error state)

    func fetchAccount() {
        // Simulated async fetch operation
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            // Replace with actual data fetching logic
            let dummyAccount = Account(userName: "Urmom369", password: "password123", profilePic: "https://media.istockphoto.com/id/1495088043/vector/user-profile-icon-avatar-or-person-icon-profile-picture-portrait-symbol-default-portrait.jpg?s=612x612&w=0&k=20&c=dhV2p1JwmloBTOaGAtaA3AW1KSnjsdMt7-U_3EZElZ0=", bio: "Hello, I ur mum!")
            self.account = dummyAccount
        }
    }
}

struct ProfileView: View {
    @StateObject var viewModel = AccountViewModel()

    var body: some View {
        VStack {
            HStack(spacing: 20) {
                // Plus Button
                NavigationLink(destination: LoginView()) {
                    Text("Login")
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.black)
                        .padding(10) // Padding inside the button
                }
                    .background(Color("off-white"))
                    .frame(width: 80, height: 100) // Size of the button
                    .cornerRadius(5)
            }
            Text("Profile") // Title for the favorites page
                .font(.title)
                .fontWeight(.bold)
                .padding()
            if let account = viewModel.account {
                // Display account information
                // Load profile picture asynchronously
                AsyncImage(url: URL(string: account.profilePic)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100) // Adjust size as needed
                        .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                }
                Text("\(account.userName)")
                    .font(.title2)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding()
                VStack{
                    Text("Bio")
                        .font(.title3)
                        .fontWeight(.bold)
                        .frame(alignment:.center)
                    Text("\(account.bio)")
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
                .background(Color("off-white"))
                .cornerRadius(5)
                VStack{
                    Text("User Recipes")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding()
                    ScrollView{
                        
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
                .background(Color("off-white"))
                .cornerRadius(5)
            } else {
                // Show loading indicator while data is being fetched
                ProgressView()
            }
        }
        // Trigger data fetching when the view appears
        .onAppear {
            viewModel.fetchAccount()
        }
        .tabItem {
            Label("Profile", systemImage: "person")
        }
    }
}

#Preview {
    ProfileView()
}
