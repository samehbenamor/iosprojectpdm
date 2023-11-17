import SwiftUI



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
        }
    }
}

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
    }
}
