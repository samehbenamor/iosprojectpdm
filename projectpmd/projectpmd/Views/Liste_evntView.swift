import SwiftUI

struct Event: Identifiable {
    let id = UUID()
    let title: String
    let image: String
    let startDate: Date
    let startheur: String
}
struct EventDetailView: View {
    @State private var isInterestedAlertPresented = false
    let event: Event
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color(red: 0.36, green: 0.70, blue: 0.36).opacity(0.5)]), startPoint: .top, endPoint: .bottom)
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
                            isInterestedAlertPresented = true
                        }) {
                            HStack {
                                Image(systemName: "icon")
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
                                
                        } .alert(isPresented: $isInterestedAlertPresented) {
                            Alert(title: Text("Message d'intérêt"), message: Text("Vous êtes intéressé(e) par cet événement."), dismissButton: .default(Text("OK")))
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
    let events: [Event] = [
        Event(title: "Événement 1", image: "image", startDate: Date(), startheur: "10:00 AM"),
        Event(title: "Événement 2", image: "image2", startDate: Date().addingTimeInterval(7200), startheur: "2:30 PM"),
        Event(title: "Événement 3", image: "image3", startDate: Date().addingTimeInterval(7200), startheur: "3:30 PM"),
        Event(title: "Événement 4", image: "image6", startDate: Date().addingTimeInterval(7200), startheur: "5:30 PM"),
        Event(title: "Événement 5", image: "image5", startDate: Date().addingTimeInterval(7200), startheur: "1:30 PM"),
        Event(title: "Événement 6", image: "image2", startDate: Date().addingTimeInterval(7200), startheur: "12:00 PM"),
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
                    .navigationBarTitle("Liste des Événements")
            }
           
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Liste_evntView()
    }
}
