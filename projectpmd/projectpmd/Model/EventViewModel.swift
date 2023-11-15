import Foundation

class EventViewModel: ObservableObject {
    @Published var event = Event(name: "", date: Date(), location: "", description: "", whatsappLink: "", selectedImage: "")
    @Published var showMessage = false
    @Published var message = ""

    func createEvent() {
        // Placez votre logique d'envoi ici en utilisant les données de `event`

        // Une fois que l'envoi est terminé, affichez le message de réussite
        message = "Event created successfully!"
        showMessage = true

        // Réinitialisez les données après la création de l'événement
        resetForm()
    }

    func resetForm() {
        // Réinitialisez les valeurs de l'événement
        event = Event(name: "", date: Date(), location: "", description: "", whatsappLink: "", selectedImage: "")
    }
}
