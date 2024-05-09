import SwiftUI
import MapKit

struct FavoritesView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 33.7175, longitude: -117.8311), // Coordinates for Orange County
        span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
    )
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Map of Orange County") // Updated title for the map page
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()

                Map(coordinateRegion: $region)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .cornerRadius(10)
                    .padding()
            }
            .navigationBarHidden(true)
        }
        .tabItem {
            Label("Map", systemImage: "map")
        }
    }
}
