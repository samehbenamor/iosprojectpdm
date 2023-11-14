import SwiftUI
import AVKit
import UniformTypeIdentifiers

import SwiftUI
import AVKit
import UniformTypeIdentifiers

struct VideoListView: View {
    @ObservedObject var viewModel = LessonViewModel()
    @State private var isAddLessonPresented = false
    @State private var newLesson: Lesson?

    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.lessons) { lesson in
                    NavigationLink(destination: VideoDetailView(lesson: lesson)) {
                        VideoCell(lesson: lesson)
                    }
                }

                Spacer()

                Button(action: {
                    isAddLessonPresented.toggle()
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Add Lesson")
                    }
                    .font(.headline)
                    .foregroundColor(.blue)
                    .padding()
                }
                .sheet(isPresented: $isAddLessonPresented, onDismiss: {
                    if let addedLesson = viewModel.lessons.last {
                        newLesson = addedLesson
                    }
                }) {
                    AddVideoView(isAddLessonPresented: $isAddLessonPresented) {
                        viewModel.fetchLessons()
                    }
                }
            }
            .navigationBarTitle("Lesson List")
            .onAppear {
                viewModel.fetchLessons()
            }
        }
        .background(
            NavigationLink(
                destination: VideoDetailView(lesson: newLesson ?? Lesson(id: "", name: "", description: "", video: "")),
                isActive: .constant(true)
            ) {
                EmptyView()
            }


        )
    }
}


<<<<<<< Updated upstream:projectpmd/lesson/lessonApp.swift
@main
struct lessonApp: App {
=======

struct AddVideoView: View {
    @State private var name = ""
    @State private var description = ""
    @State private var selectedVideoURL: URL?
    @State private var isPresentingImagePicker = false
    @ObservedObject var viewModel = LessonViewModel()
    @Binding var isAddLessonPresented: Bool
    var onDismiss: () -> Void  // Add this line

    var onLessonAdded: (() -> Void)?

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Lesson Information")) {
                    TextField("Name", text: $name)
                    TextField("Description", text: $description)
                }

                Section(header: Text("Add Video")) {
                    Button("Select Video") {
                        isPresentingImagePicker.toggle()
                    }
                }

                if let selectedVideoURL = selectedVideoURL {
                    VideoPlayer(player: AVPlayer(url: selectedVideoURL))
                        .frame(height: 200)
                }

                Section {
                                    Button("Add Video") {
                                        viewModel.addLesson(name: name, description: description, video: selectedVideoURL?.absoluteString ?? "")
                                        isAddLessonPresented = false
                                        onDismiss()
                                    }
                                    .fileImporter(
                                        isPresented: $isPresentingImagePicker,
                                        allowedContentTypes: [.movie],
                                        onCompletion: { result in
                                            do {
                                                let videoURL = try result.get()
                                                selectedVideoURL = videoURL
                                            } catch {
                                                print("Error selecting video: \(error.localizedDescription)")
                                            }
                                        }
                                    )
                                }
                                .disabled(selectedVideoURL == nil)
                            }
                            .navigationBarTitle("Add Lesson", displayMode: .inline)
                        }
                    }
                }
struct VideoDetailView: View {
    let lesson: Lesson

    @State private var player: AVPlayer?
    @State private var isFavorite = false
    @State private var likeCount = 100
    @State private var dislikeCount = 10
    @State private var isShareSheetPresented = false
    @State private var comments: [String] = []
    @State private var isCommentsSheetPresented = false

    var body: some View {
        VStack {
            if let player = player {
                VideoPlayer(player: player)
                    .onAppear {
                        player.play()
                    }
                    .onDisappear {
                        player.pause()
                    }
                    .frame(height: 300)
            }

            Text(lesson.name)
                .font(.title)
                .padding()

            Text(lesson.description)
                .foregroundColor(.gray)
                .padding()

            HStack {
                Button(action: {
                    isFavorite.toggle()
                }) {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.red)
                }

                Spacer()

                HStack {
                    Button(action: {
                        likeCount += 1
                    }) {
                        Image(systemName: "hand.thumbsup")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.blue)
                        Text("\(likeCount)")
                    }

                    Button(action: {
                        dislikeCount += 1
                    }) {
                        Image(systemName: "hand.thumbsdown")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.blue)
                        Text("\(dislikeCount)")
                    }
                }

                Spacer()

                Button(action: {
                    isShareSheetPresented.toggle()
                }) {
                    Image(systemName: "arrowshape.turn.up.right")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.blue)
                    Text("Share")
                }
            }
            .onAppear {
                player = AVPlayer(url: URL(string: lesson.video)!)
            }
            .padding(16)
            .background(Color.white)
            .cornerRadius(30)
            .shadow(radius: 5)

            Spacer()

            Button(action: {
                isCommentsSheetPresented.toggle()
            }) {
                Image(systemName: "text.bubble")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.blue)
                Text("Comments")
            }
            .padding(16)
            .background(Color.white)
            .cornerRadius(30)
            .shadow(radius: 5)
        }
        .sheet(isPresented: $isShareSheetPresented) {
            ShareSheet(activityItems: [lesson.video])
        }
        .sheet(isPresented: $isCommentsSheetPresented) {
            CommentsView(comments: $comments)
        }
    }
}

struct CommentsView: View {
    @Binding var comments: [String]

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(comments, id: \.self) { comment in
                        Text(comment)
                    }
                }

                HStack {
                    TextField("Add a comment", text: .constant(""))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)

                    Button(action: {
                        // Add new comment
                        // You can customize this action to add comments to your array
                    }) {
                        Text("Post")
                    }
                    .padding(.trailing)
                }
            }
            .navigationBarTitle("Comments", displayMode: .inline)
            .navigationBarItems(trailing: Button("Done") {
                comments.removeAll()
            })
        }
    }
}

struct ShareSheet: UIViewControllerRepresentable {
    let activityItems: [Any]

    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        return controller
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        // Update the UI if needed
    }
}

struct VideoCell: View {
    let lesson: Lesson

    var body: some View {
        NavigationLink(destination: VideoDetailView(lesson: lesson)) {
            HStack {
                if let videoURL = URL(string: lesson.video) {
                    VideoPlayer(player: AVPlayer(url: videoURL))
                        .frame(width: 60, height: 60)
                        .cornerRadius(8)
                } else {
                    // Handle invalid URL
                    Text("Invalid URL")
                        .frame(width: 60, height: 60)
                        .cornerRadius(8)
                        .background(Color.red) // Customize as needed
                }

                VStack(alignment: .leading) {
                    Text(lesson.name)
                        .font(.headline)
                    Text(lesson.description)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}


struct VideoApp: App {
>>>>>>> Stashed changes:projectpmd/projectpmd/Views/lessonApp.swift
    var body: some Scene {
        WindowGroup {
            VideoListView()
        }
    }
}

struct lesson_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
