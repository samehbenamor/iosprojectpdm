import SwiftUI

struct Event: Identifiable {
    let id = UUID()
    let title: String
    let image: String // Nom de l'image de l'événement
    let startDate: Date
   
    let startheur: String
}

struct EventDetailView: View {
    let event: Event
    
    var body: some View {
        VStack {
            Image(event.image)
                .resizable()
                .frame(width: 200, height: 200)
                .cornerRadius(8)
            
            Text(event.title)
                .font(.title)
            
            Text("Date de début : \(event.startDate, style: .date)")
            Text("Heure de début : \(event.startheur)")
            
            // Ajoutez plus de détails de l'événement ici au besoin
        }
        .navigationBarTitle("Détails de l'Événement")
    }
}

struct Liste_evntView: View {
    let events: [Event] = [
        Event(title: "Événement 1", image: "image", startDate: Date(), startheur: "10:00 AM"),
        Event(title: "Événement 2", image: "event_image2", startDate: Date().addingTimeInterval(7200), startheur: "2:30 PM"),
        // Ajoutez autant d'événements que vous le souhaitez
    ]
    
    var body: some View {
        NavigationView {
            List(events) { event in
                NavigationLink(destination: EventDetailView(event: event)) {
                    VStack(alignment: .leading) {
                        Image(event.image)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .cornerRadius(8)
                        
                        Text(event.title)
                            .font(.title)
                        
                        Text("Date de début : \(event.startDate, style: .date)")
                    }
                }
            }
            .navigationBarTitle("Liste des Événements")
        }
    }
}

struct Liste_evntView_Previews: PreviewProvider {
    static var previews: some View {
        Liste_evntView()
    }
}
