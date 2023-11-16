import SwiftUI

<<<<<<< Updated upstream
<<<<<<< Updated upstream
struct Cree_evntView: View {
    @State private var eventName = ""
    @State private var showDatePicker = false
    @State private var showTimePicker = false
    @State private var eventDate = Date()
    @State private var eventTime = Date()
    @State private var eventLocation = ""
    @State private var eventDescription = ""
    @State private var   textwhats = ""
    @State private var selectedImage = ""
    @State private var showMessage = false
    @State private var message = ""

    var body: some View {
        VStack {
            TextField("Event Name", text: $eventName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            DatePicker("Event Date", selection: $eventDate, displayedComponents: .date)
                .padding()

            TextField("Event Location", text: $eventLocation)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("Event Description", text: $eventDescription)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("lien grope WhatsApp", text: $textwhats)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            // Ajouter ici la logique pour charger ou sélectionner une image

            Button("Create Event") {
                            createEvent()
=======
=======
>>>>>>> Stashed changes

struct Cree_evntView: View {
    
    
    @StateObject var viewModel = Cree_evntViewModel()
    @State private var event = Event(eventName: "", eventDate: Date(), textwhats: "", eventLocation: "", eventDescription: "")
    @State private var showMessage = false
    @State private var message = ""
    @State private var showAlert = false
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            TextField("Event Name", text: $event.eventName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            DatePicker("Event Date", selection: $event.eventDate, displayedComponents: .date)
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
                            viewModel.createEvent(event: event)
                            showAlert = true // Show the alert when the button is pressed
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
                        }
                        .font(.headline)
                        .padding(20)
                        .background(Color(red: 0.36, green: 0.7, blue: 0.36))
                        .foregroundColor(.white)
                        .cornerRadius(10)
<<<<<<< Updated upstream
<<<<<<< Updated upstream
                        .alert(isPresented: $showMessage) {
                            Alert(title: Text("Event Creation"), message: Text(message), dismissButton: .default(Text("OK")) {
                                resetForm() // Réinitialise le formulaire après avoir appuyé sur "OK"
                            })
                        }
            
        }
        .navigationBarTitle("Create Event", displayMode: .inline)
                }

    func createEvent() {
        let url = URL(string: "http://localhost:5000/api/evenements")! // Remplacez par votre adresse du serveur
        message = "Event created successfully!" // Message à afficher
                showMessage = true
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let eventDateString = dateFormatter.string(from: eventDate)

        let body: [String: Any] = [
            "eventName": eventName,
            "eventDate": eventDateString,
            "eventLocation": eventLocation,
            "eventdesc": eventDescription,
            "textwhats":textwhats,
            "selectedImage": selectedImage
            // Ajoutez d'autres champs si nécessaire
        ]

        let jsonData = try! JSONSerialization.data(withJSONObject: body)

=======
=======
>>>>>>> Stashed changes
                        .alert(isPresented: $showAlert) {
                            Alert(
                                title: Text("Create Another Event?"),
                                message: Text("Do you want to create another event?"),
                                primaryButton: .default(Text("Yes")) {
                                    // Action to clear the fields and create another event
                                    event = Event(eventName: "", eventDate: Date(), textwhats: "", eventLocation: "", eventDescription: "")
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
class Cree_evntViewModel: ObservableObject {
    @Published var events: [Event] = []
    @Published var event = Event(id: "", eventName: "", eventDate: Date(), textwhats: "", eventLocation: "", eventDescription: "")
    func createEvent(event: Event) {
        guard let url = URL(string: "http://localhost:5000/api/evenement") else {
            return
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let jsonData = try? JSONEncoder().encode(event) else {
            return
        }
        
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
<<<<<<< Updated upstream
<<<<<<< Updated upstream

=======
        
>>>>>>> Stashed changes
=======
        
>>>>>>> Stashed changes
        URLSession.shared.dataTask(with: request) { data, response, error in
            // Gérer la réponse de l'API ici
            if let error = error {
                print("Error: \(error)")
            } else if let data = data {
                let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
                print("Response: \(responseJSON ?? "")")
                // Traitez la réponse de l'API en conséquence
            }
        }.resume()
    }
    func resetForm() {
<<<<<<< Updated upstream
<<<<<<< Updated upstream
           // Réinitialisez les valeurs de vos champs ici
           eventName = ""
           eventDate = Date()
           eventLocation = ""
           eventDescription = ""
           textwhats = ""
           selectedImage = ""
       }
}


struct Cree_evntView_Previews: PreviewProvider {
    static var previews: some View {
        Cree_evntView()
=======
=======
>>>>>>> Stashed changes
        DispatchQueue.main.async {
            self.events.append(self.event)
            self.event.eventName = ""
            self.event.eventDate = Date()
            self.event.textwhats = ""
            self.event.eventLocation = ""
            self.event.eventDescription = ""
        }
    }

    struct Cree_evntView_Previews: PreviewProvider {
        static var previews: some View {
            Cree_evntView()
        }
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
    }
}
