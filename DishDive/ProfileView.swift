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

    func signOut() {
        do {
            try Auth.auth().signOut()
            self.account = nil  // Optionally reset account data
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}

struct ProfileView: View {
    @StateObject var viewModel = AccountViewModel()
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            HStack(spacing: 20) {
                if viewModel.account != nil {
                    Button(action: {
                        viewModel.signOut()
                        presentationMode.wrappedValue.dismiss()  // This line can adjust depending on your navigation structure
                    }) {
                        Text("Sign Out")
                            .foregroundColor(.white)
                            .padding(10)
                    }
                    .frame(width: 80, height: 40)
                    .background(Color.red)
                    .cornerRadius(10)
                    .shadow(radius: 2)
                } else {
                    NavigationLink(destination: LoginView()) {
                        Text("Login")
                            .foregroundColor(.white)
                            .padding(10)
                    }
                    .frame(width: 80, height: 40)
                    .background(Color(red: 0.67, green: 0.84, blue: 0.90))
                    .cornerRadius(10)
                    .shadow(radius: 2)
                }
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
                    .background(Color("white"))
                    .cornerRadius(5)
                }
            } else {
                Text("No profile data available.")
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .onAppear {
            viewModel.fetchAccount()
        }
        .tabItem {
            Label("Profile", systemImage: "person.fill")
        }
    }
}

#Preview {
    ProfileView()
}
