import SwiftUI

<<<<<<< Updated upstream
struct Evente: Identifiable {
    let id = UUID()
    let title: String
    let image: String
    let startDate: Date
    let startheur: String
}
struct EventDetailView: View {
    @State private var isInterestedAlertPresented = false
    @State private var myEvents: [Evente] = [] // Liste de vos événements
    let event: Evente
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color.clear]), startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            .overlay(
                ScrollView {
                    VStack {
                        Image(event.image)
                            .resizable()
                            .frame(width: 300, height: 300)
                            .cornerRadius(8)
                            .padding()
                        Text(event.title)
                            .font(.title)
                            .padding()
                        
                        Text("Date de début : \(event.startDate, style: .date)")
                        Text("Heure de début : \(event.startheur)")
                            
                        Text("2k participants").padding(20)


                        Button(action: {
                                                    // Ajoutez l'événement à votre liste d'événements locale
                                                    myEvents.append(event)
                                                    isInterestedAlertPresented = true
                                                }) {
                                                    HStack {
                                                        Image(systemName: "heart.fill")
                                                            .foregroundColor(.white)

                                                        Text("Intéressé(e)")
                                                            .font(.headline)
                                                            .padding(20)
                                                    }
                                                    .font(.headline)
                                                    .padding(20)
                                                    .background(Color(red: 0.36, green: 0.7, blue: 0.36))
                                                    .foregroundColor(.white)
                                                    .cornerRadius(10)
                                                }
                                                .alert(isPresented: $isInterestedAlertPresented) {
                                                    Alert(title: Text("Message d'intérêt"), message: Text("Vous avez ajouté cet événement à vos favoris."), dismissButton: .default(Text("OK")))
                                                }

                        
                        Text("Ajoutez plus de détails de l'événement ici au besoinAjoutez plus de détails de l'événement ici au besoinAjoutez plus de détails de l'événement ici au besoinAjoutez plus de détails de l'événement ici au besoinAjoutez plus de détails de l'événement ici au besoinAjoutez plus de détails de l'événement ici au besoinAjoutez plus de détails de l'événement ici au besoinAjoutez plus de détails de l'événement ici au besoinAjoutez plus de détails de l'événement ici au besoin")
                            .padding()
                    }
                }
            )
            .navigationBarTitle("Détails de l'Événement")
    }
}

struct Liste_evntView: View {
    let events: [Evente] = [
        Evente(title: "Événement 1", image: "image", startDate: Date(), startheur: "10:00 AM"),
        Evente(title: "Événement 2", image: "image2", startDate: Date().addingTimeInterval(7200), startheur: "2:30 PM"),
        Evente(title: "Événement 3", image: "image3", startDate: Date().addingTimeInterval(7200), startheur: "3:30 PM"),
        Evente(title: "Événement 4", image: "image6", startDate: Date().addingTimeInterval(7200), startheur: "5:30 PM"),
        Evente(title: "Événement 5", image: "image5", startDate: Date().addingTimeInterval(7200), startheur: "1:30 PM"),
        Evente(title: "Événement 6", image: "image2", startDate: Date().addingTimeInterval(7200), startheur: "12:00 PM"),
    ]
    
    var body: some View {
        NavigationView {
            
            
            List(events) { event in
                NavigationLink(destination: EventDetailView(event: event)) {
                    VStack(alignment: .leading) {
                        Image(event.image)
                            .resizable()
                        
                            .cornerRadius(8)
                        
                        Text(event.title)
                            .font(.title)
                        
                        Text("Date de début : \(event.startDate, style: .date)")
                    }
                }
                .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
                .background(LinearGradient(gradient: Gradient(colors: [Color(red: 0.36, green: 0.70, blue: 0.36).opacity(0.5)]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(19)
                .overlay(RoundedRectangle(cornerRadius: 24)
                    .stroke(Color(red: 0.06, green: 0.56, blue: 0.08), lineWidth: 4)
                ) .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarTitle("Liste des Événements", displayMode: .inline)
                    .navigationBarItems(trailing:
                        HStack {
                            NavigationLink(destination: MyEventsView()) {
                                Image(systemName: "heart.fill")
                                    .foregroundColor(.white)
                                    .padding(8)
                                    .background(RoundedRectangle(cornerRadius: 8).fill(Color(red: 0.36, green: 0.7, blue: 0.36)))
                            }
                            
                        NavigationLink(destination: Cree_evntView()){
                                Image(systemName: "plus.circle.fill")
                                    .foregroundColor(.white)
                                    .padding(8)
                                    .background(RoundedRectangle(cornerRadius: 8).fill(Color(red: 0.36, green: 0.7, blue: 0.36)))
                            }
                        }
                    )


            }
           
           
=======


class Liste_eventViewModel: ObservableObject {
    @Published var events: [Event] = []

    func fetchEvents() {
        guard let url = URL(string: "http://localhost:5000/api/evenements") else {
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
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
            decoder.dateDecodingStrategy = .formatted(dateFormatter)

            do {
                let fetchedEvents = try decoder.decode([Event].self, from: data)
                DispatchQueue.main.async {
                    self.events = fetchedEvents
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
struct Liste_eventView: View {
    @StateObject var viewModel = Liste_eventViewModel()
    @State private var selectedEvent: Event?
    var body: some View {
        NavigationView {
            List(viewModel.events, id: \.id) { event in
                VStack(alignment: .leading) {
                    Text(event.eventName)
                        .font(.headline)
                    Text("Date: \(event.eventDate)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text("Location: \(event.eventLocation)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text("Description: \(event.eventDescription)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .onTapGesture {
                                    selectedEvent = event // Sélectionnez l'événement lorsqu'il est tapé
                                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
                               .navigationBarTitle("Liste des Événements", displayMode: .inline)
                               .navigationBarItems(trailing:
                                   
                                       
                                   NavigationLink(destination: Cree_evntView()){
                                           Image(systemName: "plus.circle.fill")
                                               .foregroundColor(.white)
                                               .padding(8)
                                               .background(RoundedRectangle(cornerRadius: 8).fill(Color(red: 0.36, green: 0.7, blue: 0.36)))
                                       
                                   }
                               )
                               .sheet(item: $selectedEvent) { selected in
                                              // Affichez la vue détaillée de l'événement sélectionné
                                              DetailEventView(event: selected)
                                          }
            .onAppear {
                viewModel.fetchEvents()
            }
>>>>>>> Stashed changes
        }
    }
}

<<<<<<< Updated upstream
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Liste_evntView()
=======
struct DetailEventView: View {
    let event: Event
    @State private var isInterested = false

    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(event.eventName)
                .font(.title)
            
            Text("Date: \(formattedDate(event.eventDate))")
            Text("Location: \(event.eventLocation)")
                .foregroundColor(.gray)
            Text("Description:")
                .font(.headline)
            Text(event.eventDescription)
                .foregroundColor(.gray)
            
            Button(action: {
                
                            isInterested.toggle()
                        }) {
                            HStack {
                                Image(systemName: isInterested ? "star.fill" : "star")
                                    .foregroundColor(isInterested ? .yellow : .gray)
                                    .font(.title)
                                Text(isInterested ? "Intéressé" : "Intéresser")
                                    .fontWeight(.semibold)
                                    .foregroundColor(isInterested ? .yellow : .gray)
                            }
                            .padding()
                        }
                        .buttonStyle(BorderlessButtonStyle())
                        .animation(.spring())
                    }
                    .padding()
    }
    
    private func formattedDate(_ date: Date) -> String {
        dateFormatter.string(from: date)
    }
}


struct Liste_eventView_Previews: PreviewProvider {
    static var previews: some View {
        Liste_eventView()
>>>>>>> Stashed changes
    }
}
