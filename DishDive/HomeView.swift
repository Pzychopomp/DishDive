import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = RecipeViewModel()  // Initialize ViewModel to load and manage recipe data
    @State private var searchText = ""

    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        TabView {
            NavigationView {
                VStack {
                    HStack {
                        Spacer()
                        HStack(spacing: 20) {
                            NavigationLink(destination: AddRecipe()) {
                                Image(systemName: "plus")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.black)
                                    .padding(10)  // Padding inside the button
                                    .frame(width: 50, height: 30)  // Size of the button
                                    .cornerRadius(10)  // Rounded corners
                            }

                            TextField("Search...", text: $searchText)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width: 100, height: 30)

                            Button(action: {
                                // Hide keyboard
                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                            }) {
                                
                            }
                            .padding(.trailing, 10)
                        }
                    }

                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(viewModel.recipes.filter { searchText.isEmpty || $0.recipeName.localizedCaseInsensitiveContains(searchText) }, id: \.id) { recipe in
                                RecipeBoxView(recipe: recipe)
                            }
                        }
                        .padding()
                    }
                }
                .navigationBarTitle("Recipes", displayMode: .inline)
                .onAppear {
                    viewModel.loadRecipesFromFirestore()  // Load recipes when the view appears
                }
            }
        }
        .tabItem {
            Label("Home", systemImage: "house")
        }
    }
}
