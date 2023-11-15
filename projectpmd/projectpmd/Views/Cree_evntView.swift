import SwiftUI

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
                        }
                        .font(.headline)
                        .padding(20)
                        .background(Color(red: 0.36, green: 0.7, blue: 0.36))
                        .foregroundColor(.white)
                        .cornerRadius(10)
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

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData

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
    }
}
