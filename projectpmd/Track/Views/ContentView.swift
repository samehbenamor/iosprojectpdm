import SwiftUI

struct User: Identifiable {
    let id = UUID()
    var name: String
    var points: Int
}

struct LeaderboardView: View {
    @State private var isMapViewActive = false
    let users: [User]

    var sortedUsers: [User] {
        return users.sorted(by: { $0.points > $1.points })
    }

    var body: some View {
        NavigationView {
            VStack {
                List {
                    NavigationLink(destination: MapView(), isActive: $isMapViewActive) {
                        EmptyView() // Ceci masque le lien de navigation
                    }
                    .hidden() // Cacher le lien de navigation

                    ForEach(sortedUsers.indices, id: \.self) { index in
                        HStack {
                            Text("\(index + 1)")
                            Text(sortedUsers[index].name)
                            Spacer()
                            Text("\(sortedUsers[index].points) points")
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle())
                .navigationTitle("Classement")

                Button(action: {
                    isMapViewActive = true
                    // Add action for "Convertir vos points" button here
                    print("Convertir vos points tapped")
                }) {
                    Text("Convertir vos points")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
            }
        }
    }
}

struct ContentView: View {
    let users: [User] = [
        User(name: "Utilisateur 1", points: 150),
        User(name: "Utilisateur 2", points: 200),
        User(name: "Utilisateur 3", points: 100),
        // ... Add more users here
    ]

    var body: some View {
        LeaderboardView(users: users)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
