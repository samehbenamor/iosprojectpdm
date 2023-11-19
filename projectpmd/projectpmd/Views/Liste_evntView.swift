import SwiftUI



class Liste_lessonViewModel: ObservableObject {
    @Published var lessons: [Lesson] = []

    func fetchLessons() {
<<<<<<< Updated upstream
        guard let url = URL(string: "http://localhost:5000/lessons") else {
=======
        guard let url = URL(string: "http://localhost:5001/lessons") else {
>>>>>>> Stashed changes
            print("URL invalide")
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Erreur lors de la récupération des lessons : \(error)")
                return
            }

            guard let data = data else {
                print("Aucune donnée trouvée")
                return
            }
            let decoder = JSONDecoder()
            do {
                let json = try decoder.decode(ResponseModel.self, from: data)
                
                if json.message == "List of lessons" {
                    DispatchQueue.main.async {
                        self.lessons = json.list
                        print("Fetched lessons:")
                        print(self.lessons)
                    }
                } else {
                    print("Error: Invalid JSON structure or message.")
                }
            } catch {
                print("Error decoding JSON: \(error)")
                if let jsonString = String(data: data, encoding: .utf8) {
                    print("JSON received: \(jsonString)")
                } else {
                    print("Unable to convert JSON data to string")
                }
                return // Exit the method to prevent further processing with invalid data
            }





        }.resume()
    }
}
struct Liste_lessonView: View {
    @StateObject var viewModel = Liste_lessonViewModel()
    @State private var selectedLesson: Lesson?
    
    var body: some View {
        NavigationView {
            List(viewModel.lessons, id: \.id) { lesson in
                LessonCellView(lesson: lesson)
                    .onTapGesture {
                        selectedLesson = lesson // Select the lesson when tapped
                    }
            }
            .navigationBarTitle("Liste des lessons", displayMode: .inline)
            .navigationBarItems(trailing:
                NavigationLink(destination: Cree_lessonView()) {
                    Image(systemName: "plus.circle.fill")
<<<<<<< Updated upstream
                        .foregroundColor(.accentColor)
=======
                        .foregroundColor(.green)
>>>>>>> Stashed changes
                        .font(.title)
                        .padding()
                }
            )
            .sheet(item: $selectedLesson) { selected in
                // Display the detailed view of the selected lesson
                DetailLessonView(lesson: selected)
            }
            .onAppear {
                viewModel.fetchLessons()
            }
        }
    }
}

struct LessonCellView: View {
    let lesson: Lesson
    
    var body: some View {
<<<<<<< Updated upstream
        VStack(alignment: .leading, spacing: 8) {
            Text(lesson.name)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            Text(lesson.description)
                .font(.body)
                .foregroundColor(.secondary)
                .lineLimit(2) // Adjust the number of lines as needed
            
            Divider() // Add a separator between cells
        }
        .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
    }
}

=======
        HStack(alignment: .top, spacing: 16) {
            // Add an image to the left
            Image(systemName: "book")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.green)

            VStack(alignment: .leading, spacing: 8) {
                Text(lesson.name)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                Text(lesson.description)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .lineLimit(2) // Adjust the number of lines as needed
            }
            .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 16))
        }
        .background(Color.green.opacity(0.4))
        .cornerRadius(20)
        .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)) // Adjust padding to increase cell height
    }
}



>>>>>>> Stashed changes
struct DetailLessonView: View {
    let lesson: Lesson
    @State private var isLiked = false
    @State private var isDisliked = false
    @State private var isShared = false
    @State private var isCommented = false
    @State private var showComments = false

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(lesson.name)
                .font(.title)

            Text("Description:")
                .font(.headline)
            Text(lesson.description)
                .foregroundColor(.gray)

            HStack(spacing: 40) {
                Button(action: {
                    // Action for like button
                    isLiked.toggle()
<<<<<<< Updated upstream
=======
                    if isLiked {
                        isDisliked = false
                    }
>>>>>>> Stashed changes
                }) {
                    Image(systemName: isLiked ? "hand.thumbsup.fill" : "hand.thumbsup")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .foregroundColor(isLiked ? Color.blue : Color.gray)
                    Text(isLiked ? "Like" : "")
                        .fontWeight(.semibold)
                        .foregroundColor(isLiked ? .blue : .gray)
                }

                Button(action: {
                    // Action for dislike button
                    isDisliked.toggle()
<<<<<<< Updated upstream
=======
                    if isDisliked {
                        isLiked = false
                    }
>>>>>>> Stashed changes
                }) {
                    Image(systemName: isDisliked ? "hand.thumbsdown.fill" : "hand.thumbsdown")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .foregroundColor(isDisliked ? Color.red : Color.gray)
                    Text(isDisliked ? "Dislike" : "")
                        .fontWeight(.semibold)
                        .foregroundColor(isDisliked ? .red : .gray)
                }

<<<<<<< Updated upstream
=======
            

>>>>>>> Stashed changes
                Button(action: {
                    // Action for share button
                    isShared.toggle()
                }) {
                    Image(systemName: "arrowshape.turn.up.right.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .foregroundColor(isShared ? Color.green : Color.gray)
                    Text(isShared ? "Share" : "")
                        .fontWeight(.semibold)
                        .foregroundColor(isShared ? .green : .gray)
                }
                .onTapGesture {
                    // Present the share sheet
                    isShared.toggle()
                }
                .sheet(isPresented: $isShared, content: {
                    ActivityView(activityItems: [lesson.name, lesson.description])
                })

                Button(action: {
                    // Action for comment button
                    showComments.toggle()
                }) {
                    Image(systemName: "text.bubble.fill")
<<<<<<< Updated upstream
                        .foregroundColor(.purple)
                        .font(.title)
                    Text("Comments")
                        .fontWeight(.semibold)
                        .foregroundColor(.purple)
=======
                        .foregroundColor(.green)
                        .font(.title)
                    Text("Comments")
                        .fontWeight(.semibold)
                        .foregroundColor(.green)
>>>>>>> Stashed changes
                }
                .sheet(isPresented: $showComments) {
                    CommentView(lesson: lesson)
                }
            }
        }
        .padding()
    }
}


struct CommentView: View {
    @State private var commentText: String = ""
    @State private var comments: [Comment] = [] // Collection to store comments
    let lesson: Lesson

    var body: some View {
        VStack {
            // Display existing comments
<<<<<<< Updated upstream
            List(comments, id: \.ids) { comment in
                Text(comment.text)
            }

=======
            ScrollView {
                           LazyVStack(alignment: .leading, spacing: 8) {
                               ForEach(comments, id: \.id) { comment in
                                   CommentCell(comment: comment, personName: "John Doe", personImage: "image2")
                               }
                           }
                           .background(
                               RoundedRectangle(cornerRadius: 10)
                                   .fill(Color.green.opacity(0.1))
                                   .padding(.horizontal)
                           )
                       }
                       .frame(maxHeight: 500) // Adjust the maxHeight based on your layout
>>>>>>> Stashed changes
            // Add a text field for entering comments
            TextField("Write your comment...", text: $commentText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
<<<<<<< Updated upstream
=======
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.secondary.opacity(0.1))
                        .padding(.horizontal)
                )
>>>>>>> Stashed changes

            // Add a button to submit the comment
            Button("Post Comment") {
                // Handle the action of posting the comment
                postComment()
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
<<<<<<< Updated upstream
            .cornerRadius(8)
        }
        .padding()
        .onAppear {
            fetchComments()
        }
    }
=======
        }
              .padding()
              .onAppear {
                  fetchComments()
              }
          }
>>>>>>> Stashed changes

    // Function to handle posting the comment
    func postComment() {
        // Implement logic to post the comment to your backend
        guard let lessonId = lesson.id else {
            print("Lesson ID is nil")
            return
        }

        let commentData = [
            "lessonId": lessonId,
            "text": commentText
        ]

        NetworkingManager.shared.postComment(commentData) { result in
            switch result {
            case .success(let comment):
                // Update the local comments array
                comments.append(comment)
            case .failure(let error):
                print("Error posting comment: \(error)")
            }
        }

        // Clear the comment text after posting
        commentText = ""
    }

    // Function to fetch comments
    func fetchComments() {
        // Safely unwrap the lesson.id
        guard let lessonId = lesson.id else {
            print("Lesson ID is nil")
            return
        }

        // Use lessonId to fetch comments
        NetworkingManager.shared.getCommentsByLessonId(lessonId) { result in
            switch result {
            case .success(let fetchedComments):
                // Update the local comments array
                comments = fetchedComments
            case .failure(let error):
                print("Error fetching comments: \(error)")
            }
        }
    }
}
<<<<<<< Updated upstream
=======
struct CommentCell: View {
    let comment: Comment
    let personName: String
    let personImage: String

    init(comment: Comment, personName: String, personImage: String) {
        self.comment = comment
        self.personName = personName
        self.personImage = personImage
    }

    var body: some View {
        HStack {
            // Add an image (replace "profile_image" with your image name)
            Image(personImage)
                .resizable()
                .frame(width: 40, height: 40)
                .clipShape(Circle())

            // Display name, text, and other comment details
            VStack(alignment: .leading, spacing: 4) {
                Text(personName)
                    .font(.headline)
                Text(comment.text)
                    .foregroundColor(.primary)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.green))
        }
        .padding(.horizontal)
    }
}

 
>>>>>>> Stashed changes


struct ActivityView: UIViewControllerRepresentable {
    var activityItems: [Any]

    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        return controller
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        // Update the view controller
    }
}


struct Liste_lessonView_Previews: PreviewProvider {
    static var previews: some View {
<<<<<<< Updated upstream
        DetailLessonView(lesson: Lesson(name: "Sample Lesson", description: "Sample Description"))
=======
        Liste_lessonView()
>>>>>>> Stashed changes
    }
}
