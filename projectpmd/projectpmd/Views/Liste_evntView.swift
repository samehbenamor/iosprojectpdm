import SwiftUI



class Liste_lessonViewModel: ObservableObject {
    @Published var lessons: [Lesson] = []

    func fetchLessons() {
<<<<<<< Updated upstream
<<<<<<< Updated upstream
        guard let url = URL(string: "http://localhost:5000/lessons") else {
=======
        guard let url = URL(string: "http://localhost:5001/lessons") else {
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
                return // Exit the method to prevent further processing with invalid data
=======
                return
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
                        selectedLesson = lesson // Select the lesson when tapped
=======
                        selectedLesson = lesson
>>>>>>> Stashed changes
                    }
            }
            .navigationBarTitle("Liste des lessons", displayMode: .inline)
            .navigationBarItems(trailing:
                NavigationLink(destination: Cree_lessonView()) {
                    Image(systemName: "plus.circle.fill")
<<<<<<< Updated upstream
<<<<<<< Updated upstream
                        .foregroundColor(.accentColor)
=======
                        .foregroundColor(.green)
>>>>>>> Stashed changes
=======

                        .foregroundColor(.green)
>>>>>>> Stashed changes
                        .font(.title)
                        .padding()
                }
            )
            .sheet(item: $selectedLesson) { selected in
<<<<<<< Updated upstream
                // Display the detailed view of the selected lesson
=======
>>>>>>> Stashed changes
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
=======

>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
                    .lineLimit(2) // Adjust the number of lines as needed
=======
                    .lineLimit(2)
>>>>>>> Stashed changes
            }
            .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 16))
        }
        .background(Color.green.opacity(0.4))
        .cornerRadius(20)
<<<<<<< Updated upstream
        .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)) // Adjust padding to increase cell height
=======
        .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
>>>>>>> Stashed changes
    }
}



<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
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
<<<<<<< Updated upstream
                    // Action for like button
                    isLiked.toggle()
<<<<<<< Updated upstream
=======
                    if isLiked {
                        isDisliked = false
                    }
>>>>>>> Stashed changes
=======
                    isLiked.toggle()
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
<<<<<<< Updated upstream
                    // Action for dislike button
                    isDisliked.toggle()
<<<<<<< Updated upstream
=======
                    if isDisliked {
                        isLiked = false
                    }
>>>>>>> Stashed changes
=======
                    isDisliked.toggle()
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
<<<<<<< Updated upstream
=======
            

>>>>>>> Stashed changes
                Button(action: {
                    // Action for share button
=======
            

                Button(action: {
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
                    // Present the share sheet
=======
>>>>>>> Stashed changes
                    isShared.toggle()
                }
                .sheet(isPresented: $isShared, content: {
                    ActivityView(activityItems: [lesson.name, lesson.description])
                })

                Button(action: {
<<<<<<< Updated upstream
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
=======
                    showComments.toggle()
                }) {
                    Image(systemName: "text.bubble.fill")

>>>>>>> Stashed changes
                        .foregroundColor(.green)
                        .font(.title)
                    Text("Comments")
                        .fontWeight(.semibold)
                        .foregroundColor(.green)
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
                }
                .sheet(isPresented: $showComments) {
                    CommentView(lesson: lesson)
                }
            }
        }
<<<<<<< Updated upstream
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
=======
        Button(action: {
                   likeLesson()
               }) {
                   Image(systemName: isLiked ? "heart.fill" : "heart")
                       .resizable()
                       .aspectRatio(contentMode: .fit)
                       .frame(width: 25, height: 25)
                       .foregroundColor(isLiked ? Color.red : Color.gray)
                   Text(isLiked ? "Liked" : "Like")
                       .fontWeight(.semibold)
                       .foregroundColor(isLiked ? .red : .gray)
               }
               .padding()
           }

           func likeLesson() {
               guard let lessonId = lesson.id else {
                   print("Lesson ID is nil")
                   return
               }

               NetworkingManager.shared.likeLesson(lessonId: lessonId) { result in
                   switch result {
                   case .success:
                       // Toggle the liked status locally
                       self.isLiked.toggle()

                       // Trigger the refresh of Liste_meslessonView
                       NotificationCenter.default.post(name: NSNotification.Name("refreshListeMesLesson"), object: nil)

                   case .failure(let error):
                       print("Error liking lesson: \(error)")
                   }
               }
           }
       }

struct CommentView: View {
    @State private var commentText: String = ""
       @State private var comments: [Comment] = []
       let lesson: Lesson

    var body: some View {
        VStack {

>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
                       .frame(maxHeight: 500) // Adjust the maxHeight based on your layout
>>>>>>> Stashed changes
            // Add a text field for entering comments
            TextField("Write your comment...", text: $commentText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
<<<<<<< Updated upstream
=======
=======
                       .frame(maxHeight: 500)
            TextField("Write your comment...", text: $commentText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

>>>>>>> Stashed changes
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.secondary.opacity(0.1))
                        .padding(.horizontal)
                )
<<<<<<< Updated upstream
>>>>>>> Stashed changes

            // Add a button to submit the comment
            Button("Post Comment") {
                // Handle the action of posting the comment
=======

            Button("Post Comment") {
>>>>>>> Stashed changes
                postComment()
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
<<<<<<< Updated upstream
<<<<<<< Updated upstream
            .cornerRadius(8)
        }
        .padding()
        .onAppear {
            fetchComments()
        }
    }
=======
=======

>>>>>>> Stashed changes
        }
              .padding()
              .onAppear {
                  fetchComments()
              }
          }
<<<<<<< Updated upstream
>>>>>>> Stashed changes

    // Function to handle posting the comment
    func postComment() {
        // Implement logic to post the comment to your backend
=======

    func postComment() {
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
                // Update the local comments array
=======
>>>>>>> Stashed changes
                comments.append(comment)
            case .failure(let error):
                print("Error posting comment: \(error)")
            }
        }

<<<<<<< Updated upstream
        // Clear the comment text after posting
        commentText = ""
    }

    // Function to fetch comments
    func fetchComments() {
        // Safely unwrap the lesson.id
=======
        commentText = ""
    }

    func fetchComments() {
>>>>>>> Stashed changes
        guard let lessonId = lesson.id else {
            print("Lesson ID is nil")
            return
        }

<<<<<<< Updated upstream
        // Use lessonId to fetch comments
        NetworkingManager.shared.getCommentsByLessonId(lessonId) { result in
            switch result {
            case .success(let fetchedComments):
                // Update the local comments array
=======
        NetworkingManager.shared.getCommentsByLessonId(lessonId) { result in
            switch result {
            case .success(let fetchedComments):
>>>>>>> Stashed changes
                comments = fetchedComments
            case .failure(let error):
                print("Error fetching comments: \(error)")
            }
        }
    }
}
<<<<<<< Updated upstream
<<<<<<< Updated upstream
=======
=======

>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
            // Add an image (replace "profile_image" with your image name)
=======
>>>>>>> Stashed changes
            Image(personImage)
                .resizable()
                .frame(width: 40, height: 40)
                .clipShape(Circle())

<<<<<<< Updated upstream
            // Display name, text, and other comment details
=======
>>>>>>> Stashed changes
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

 
<<<<<<< Updated upstream
>>>>>>> Stashed changes

=======
>>>>>>> Stashed changes

struct ActivityView: UIViewControllerRepresentable {
    var activityItems: [Any]

    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        return controller
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
<<<<<<< Updated upstream
        // Update the view controller
=======
>>>>>>> Stashed changes
    }
}


struct Liste_lessonView_Previews: PreviewProvider {
    static var previews: some View {
<<<<<<< Updated upstream
<<<<<<< Updated upstream
        DetailLessonView(lesson: Lesson(name: "Sample Lesson", description: "Sample Description"))
=======
        Liste_lessonView()
>>>>>>> Stashed changes
=======
        Liste_lessonView()
>>>>>>> Stashed changes
    }
}
