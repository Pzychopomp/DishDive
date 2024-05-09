import SwiftUI
import FirebaseFirestore

struct AddRecipe: View {
    @Environment(\.presentationMode) var presentationMode

    @State private var recipeName = ""
    @State private var regionSelection: Region? = nil
    @State private var shortDescription = ""
    @State private var cookingTime = ""
    @State private var servingSize = ""
    @State private var ingredients = ""
    @State private var steps = ""
    @State private var imageURL = ""

    enum Region: String, CaseIterable, Identifiable {
        case american = "American"
        case asian = "Asian"
        case mexican = "Mexican"

        var id: String { self.rawValue }
    }

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    // Image URL input
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Image URL")
                        TextField("Enter image URL", text: $imageURL)
                            .textFieldStyle(.roundedBorder)
                            .frame(width: geometry.size.width / 1.2)
                            .background(Color.white)
                            .cornerRadius(5)
                    }

                    // Recipe Name
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Recipe Name")
                        TextField("Enter recipe name", text: $recipeName)
                            .textFieldStyle(.roundedBorder)
                            .frame(width: geometry.size.width / 1.2)
                            .background(Color.white)
                            .cornerRadius(5)
                    }

                    // Region Selection
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Region")
                        Picker("Region", selection: $regionSelection) {
                            Text("Select a region").tag(nil as Region?)
                            ForEach(Region.allCases) { region in
                                Text(region.rawValue).tag(region as Region?)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        .frame(width: geometry.size.width / 1.2)
                        .background(Color.white)
                        .cornerRadius(5)
                    }

                    // Short Description
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Short Description")
                        TextField("Enter a short description", text: $shortDescription)
                            .textFieldStyle(.roundedBorder)
                            .frame(width: geometry.size.width / 1.2)
                            .background(Color.white)
                            .cornerRadius(5)
                    }

                    // Time to Cook + Serving Size
                    HStack(spacing: 20) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Cooking Time")
                            TextField("E.g., 30 minutes", text: $cookingTime)
                                .textFieldStyle(.roundedBorder)
                                .frame(width: geometry.size.width / 2.6)
                                .background(Color.white)
                                .cornerRadius(5)
                        }
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Serving Size")
                            TextField("E.g., 4", text: $servingSize)
                                .textFieldStyle(.roundedBorder)
                                .keyboardType(.numberPad)
                                .frame(width: geometry.size.width / 2.6)
                                .background(Color.white)
                        }
                    }

                    // Ingredients
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Ingredients")
                        TextEditor(text: $ingredients)
                            .frame(width: geometry.size.width / 1.2, height: geometry.size.height / 4.5)
                            .background(Color.white)
                            .cornerRadius(5)
                    }

                    // Steps
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Steps")
                        TextEditor(text: $steps)
                            .frame(width: geometry.size.width / 1.2, height: geometry.size.height / 2.5)
                            .background(Color.white)
                            .cornerRadius(5)
                    }

                    // Done
                    Button("Done") {
                        addRecipeToFirestore()
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    .bold()
                    .padding(10)
                    .frame(width: geometry.size.width / 4, height: geometry.size.height / 12, alignment: .center)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding()
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
            .background(Color("white"))
            .cornerRadius(2)
            .navigationBarTitle("Add Recipe", displayMode: .inline)
        }
    }

    private func addRecipeToFirestore() {
        let db = Firestore.firestore()
        let recipeData: [String: Any] = [
            "recipeName": recipeName,
            "region": regionSelection?.rawValue ?? "Unknown",
            "shortDescription": shortDescription,
            "cookingTime": cookingTime,
            "servingSize": servingSize,
            "ingredients": ingredients,
            "steps": steps,
            "imageURL": imageURL
        ]
        
        db.collection("recipes").addDocument(data: recipeData) { error in
            if let error = error {
                print("Error adding document: \(error)")
            } else {
                print("Document added successfully!")
            }
        }
    }
}
