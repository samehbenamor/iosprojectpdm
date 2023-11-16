import SwiftUI



class Liste_lessonViewModel: ObservableObject {
    @Published var lessons: [Lesson] = []

    func fetchLessons() {
        guard let url = URL(string: "http://localhost:5010/lessons") else {
            print("URL invalide")
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Erreur lors de la récupération des événements : \(error)")
                return
            }

            guard let data = data else {
                print("Aucune donnée trouvée")
                return
            }
            let decoder = JSONDecoder()

            do {
                let fetchedLessons = try decoder.decode([Lesson].self, from: data)
                DispatchQueue.main.async {
                    self.lessons = fetchedLessons
                }
            } catch {
                print("Erreur de décodage JSON : \(error)")
                if let jsonString = String(data: data, encoding: .utf8) {
                    print("JSON reçu : \(jsonString)")
                } else {
                    print("Impossible de convertir les données JSON en chaîne")
                }
            }
        }.resume()
    }
}
struct Liste_lessonView: View {
    @StateObject var viewModel = Liste_lessonViewModel()
    @State private var selectedLesson: Lesson?
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.lessons, id: \.id) { lesson in
                    VStack(alignment: .leading, spacing: 8) {
                        Text(lesson.name)
                            .font(.title)
                            .foregroundColor(.primary)
                        
                        Text("description: \(lesson.description)")
                            .font(.body)
                            .foregroundColor(.secondary)
                    }
                    .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.1)))
                    .onTapGesture {
                        selectedLesson = lesson // Select the lesson when tapped
                    }
                }
                .listStyle(PlainListStyle()) // Use a plain list style for a cleaner look
                
                Spacer() // Add space to push the button to the bottom
                
                NavigationLink(destination: Cree_lessonView()) {
                    HStack {
                        Spacer() // Align the button to the right
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.white)
                            .padding(8)
                            .background(RoundedRectangle(cornerRadius: 8).fill(Color.blue)) // Change the color
                            .padding(16) // Add padding to the button
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitle("Liste des Lessons", displayMode: .inline)
            .navigationBarTitle("Liste des Lessons", displayMode: .inline)
            .navigationBarTitleDisplayMode(.large) // Set the title display mode to large
            .foregroundColor(Color.blue) // Set dark green color for navigation bar items
            .sheet(item: $selectedLesson) { selected in
                // Display the detailed view of the selected lesson
                DetailLessonView(lesson: selected)
            }
            .onAppear {
                viewModel.fetchLessons()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle()) // Use stack navigation view style for better compatibility
    }

}
struct DetailLessonView: View {
    let lesson: Lesson
    @State private var likes = 0
    @State private var dislikes = 0
    @State private var comments = [String]()
    @State private var isLiked = false
    @State private var isDisliked = false

    var body: some View {
        VStack {
            Text(lesson.name)
                .font(.title)
            Text("Description: \(lesson.description)")

            HStack {
                Button(action: {
                    // Action for like button
                    if isLiked {
                        likes -= 1
                    } else {
                        likes += 1
                    }
                    isLiked.toggle()
                }) {
                    Image(systemName: isLiked ? "hand.thumbsup.fill" : "hand.thumbsup")
                        .font(.title)
                }
                .foregroundColor(isLiked ? .blue : .gray)

                Button(action: {
                    // Action for dislike button
                    if isDisliked {
                        dislikes -= 1
                    } else {
                        dislikes += 1
                    }
                    isDisliked.toggle()
                }) {
                    Image(systemName: isDisliked ? "hand.thumbsdown.fill" : "hand.thumbsdown")
                        .font(.title)
                }
                .foregroundColor(isDisliked ? .red : .gray)

                Spacer()

                Button(action: {
                    // Action for comment button
                    // You can implement comment functionality here
                }) {
                    Image(systemName: "text.bubble.fill")
                        .font(.title)
                }
                .foregroundColor(.gray)

                Button(action: {
                    // Action for share button
                    // You can implement share functionality here
                }) {
                    Image(systemName: "arrowshape.turn.up.right.fill")
                        .font(.title)
                }
                .foregroundColor(.gray)
            }

            // Display like, dislike, comment counts
            Text("Likes: \(likes)")
            Text("Dislikes: \(dislikes)")
            Text("Comments: \(comments.count)")
        }
        .padding()
    }
}


struct Liste_lessonView_Previews: PreviewProvider {
    static var previews: some View {
        Liste_lessonView()
    }
}
