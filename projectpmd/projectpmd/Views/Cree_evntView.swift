/*import SwiftUI

struct Cree_evntView: View {
    
    @StateObject var viewModel = Cree_evntViewModel()
      @State private var event = Event(eventName: "", eventDate: Date(), textwhats: "", eventLocation: "", eventDescription: "", imageURL: "")
      @State private var image: UIImage? // État pour l'image sélectionnée
      @State private var isImagePickerPresented = false // État pour afficher l'UIImagePicker
      @State private var showMessage = false
      @State private var message = ""
      @State private var showAlert = false
      @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Button("") {
                            // Afficher l'UIImagePicker
                        }
                        .sheet(isPresented: $isImagePickerPresented) {
                            ImagePicker(selectedImage: $image)
                        }
            
            if let image = image {
                            // Afficher l'image sélectionnée si elle existe
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: .infinity, maxHeight: 200)
                                .padding()
                        } else {
                            // Utiliser uniquement l'icône d'upload sans le bouton
                            Image(systemName: "arrow.up.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50) // Ajuster la taille de l'icône selon vos besoins
                                .foregroundColor(Color(red: 0.36, green: 0.7, blue: 0.36)) // Couleur de l'icône
                                .onTapGesture {
                                    isImagePickerPresented = true // Afficher l'UIImagePicker lorsqu'on appuie sur l'icône
                                }
                        
                       }
            TextField("Event Name", text: $event.eventName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
        
                DatePicker("Event Date", selection: $event.eventDate, in:Date()...)
        

                    .padding()
            
            TextField("Event Location", text: $event.eventLocation)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Event Description", text: $event.eventDescription)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("lien grope WhatsApp", text: $event.textwhats)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            // Ajouter ici la logique pour charger ou sélectionner une image
           

            Button("Create Event") {
                if let image = image {
                    // Logic to upload image and get the image URL
                    // Use the obtained image to assign it to event.image
                }
                viewModel.createEvent(event: event)
                showAlert = true
            }
            .font(.headline)
            .padding(20)

                        .background(Color(red: 0.36, green: 0.7, blue: 0.36))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .alert(isPresented: $showAlert) {
                            Alert(
                                title: Text("Create Another Event?"),
                                message: Text("Do you want to create another event?"),
                                primaryButton: .default(Text("Yes")) {
                                    // Action to clear the fields and create another event
                                    event = Event(eventName: "", eventDate: Date(), textwhats: "", eventLocation: "", eventDescription: "",imageURL: "")
                                },
                                secondaryButton: .default(Text("No")) {
                                    presentationMode.wrappedValue.dismiss() // Dismiss the current view
                                }
                            )
                        }
                    }
                    .navigationBarTitle("Create Event", displayMode: .inline)
                }
            }



struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var presentationMode
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.selectedImage = uiImage
            }
            
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}


/*class Cree_evntViewModel: ObservableObject {
    @Published var events: [Event] = []
    @Published var event = Event(id: "", eventName: "", eventDate: Date(), textwhats: "", eventLocation: "", eventDescription: "", imageURL: "")
    
    func createEvent(event: Event) {
        guard let url = URL(string: "http://localhost:5001/api/evenement") else {
            print("URL invalide")
            return
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        
        do {
            var jsonEvent = try JSONEncoder().encode(event)
            var eventDict = try JSONSerialization.jsonObject(with: jsonEvent, options: []) as? [String: Any] ?? [:]

            // Formater la date dans le dictionnaire avant l'envoi au serveur
            let formattedDate = dateFormatter.string(from: event.eventDate)
            eventDict["eventDate"] = formattedDate

            let updatedJsonEvent = try JSONSerialization.data(withJSONObject: eventDict)

            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = updatedJsonEvent

            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Erreur de requête : \(error)")
                    return
                }
                
                guard let data = data else {
                    print("Aucune donnée retournée")
                    return
                }

                do {
                    let responseJSON = try JSONSerialization.jsonObject(with: data, options: [])
                    print("Réponse du serveur : \(responseJSON)")
                    // Traitez la réponse du serveur en conséquence
                } catch {
                    print("Erreur de sérialisation JSON : \(error)")
                }
            }.resume()
        } catch {
            print("Erreur d'encodage JSON : \(error)")
        }
    }




    /*func resetForm() {
        DispatchQueue.main.async {
            self.events.append(self.event)
            self.event.eventName = ""
            self.event.eventDate = Date()
            self.event.textwhats = ""
            self.event.eventLocation = ""
            self.event.eventDescription = ""
        }
    }*/
    

    struct Cree_evntView_Previews: PreviewProvider {
        static var previews: some View {
            Cree_evntView()
        }
    }
}

*/*/
