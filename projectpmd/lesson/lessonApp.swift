import SwiftUI
  import AVKit
  import UniformTypeIdentifiers

  struct VideoData {
      let url: URL
      var description: String?
  }


  struct VideoUploadView: View {
      @State private var selectedVideos: [VideoData] = []
      @State private var isUploading = false
      @State private var showDescriptionPopup = false
      @State private var description: String = ""
      @State private var enteredDescription: String = ""

      var body: some View {
          NavigationView {
                      List(selectedVideos, id: \.url) { videoData in
                          NavigationLink(destination: VideoDetailView(videoURL: videoData.url)) {
                              VideoCellView(videoURL: videoData.url, videoDescription: enteredDescription)
                          }
                      }
          
            .navigationBarTitle("Uploaded Videos")
            .navigationBarItems(trailing:
                Button("Select Video") {
                    self.selectVideo()
                }
                .fileImporter(isPresented: $isUploading, allowedContentTypes: [.movie], onCompletion: handleFileSelection)
            )
        }

        .sheet(isPresented: $showDescriptionPopup) {
            DescriptionPopupView(description: $description, onDone: {
                enteredDescription = description
                showDescriptionPopup = false
            })
        }
    }

    func selectVideo() {
        isUploading = true
    }

    func handleFileSelection(result: Result<URL, Error>) {
        isUploading = false
        do {
            let videoURL = try result.get()
            let fileExtension = videoURL.pathExtension.lowercased()

            if fileExtension == "mov" || fileExtension == "mp4" {
                let videoData = VideoData(url: videoURL, description: enteredDescription)
                selectedVideos.append(videoData)
                showDescriptionPopup = true
                // Handle the upload process to your server or cloud storage here
            } else {
                print("Unsupported file format: \(fileExtension)")
            }
        } catch {
            // Handle any errors during video selection/upload
            print("Error: \(error.localizedDescription)")
        }
    }
}

struct DescriptionPopupView: View {
    @Binding var description: String
    let onDone: () -> Void

    var body: some View {
        VStack {
            TextField("Enter video description", text: $description)
                .padding()

            Button("Done") {
                onDone()
            }
            .padding()
        }
        .frame(width: 300, height: 150)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
struct VideoCellView: View {
    let videoURL: URL
    let videoDescription: String

    var body: some View {
        HStack {
            VideoPlayer(player: AVPlayer(url: videoURL))
                .frame(width: 150, height: 150)
                .cornerRadius(10)
                .shadow(radius: 5)
            
            Text(videoDescription)
                .frame(maxWidth: .infinity)
                .padding()
        }
        .background(Color(red: 0.36, green: 0.70, blue: 0.36).opacity(0.5))
        .cornerRadius(19)
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Color(red: 0.06, green: 0.56, blue: 0.08), lineWidth: 4)
        )
    }
}


@main
struct lessonApp: App {
    var body: some Scene {
        WindowGroup {
            VideoUploadView()
        }
    }
}

struct lesson_Previews: PreviewProvider {
    static var previews: some View {
        VideoUploadView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
