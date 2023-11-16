//
//  myEventsView.swift
//  projectpmd
//
//  Created by Mac-Mini-2021 on 13/11/2023.
//
<<<<<<< Updated upstream

import SwiftUI
struct MyEventsView: View {
   @State private var myEvents: [Evente] = [] // Votre liste d'événements
    
    var body: some View {
        NavigationView {
            List(myEvents, id: \.id) { event in
                NavigationLink(destination: EventDetailView(event: event)) {
                    VStack(alignment: .leading) {
                   
                            
                        Text("Date de début : \(event.startDate, style: .date)")
                        Text("Heure de début : \(event.startheur)")
=======
/*
import SwiftUI
struct MyEventsView: View {
    @Published var events: [Event] = []
    
    var body: some View {
        NavigationView {
            List(events, id: \.id) { event in
                NavigationLink(destination: EventDetailView(event: event)) {
                    VStack(alignment: .leading) {
                        Text(event.title)
                            .font(.headline)
                        Text("Date: \(event.date)")
                            .font(.subheadline)
                        Text("Location: \(event.location)")
                            .font(.subheadline)
>>>>>>> Stashed changes
                    }
                }
            }
            .navigationBarTitle("Mes Événements")
<<<<<<< Updated upstream
=======

>>>>>>> Stashed changes
            
        }
        }
    
    
    
}


struct MyEventsView_Previews: PreviewProvider {
    static var previews: some View {
        MyEventsView()
    }
<<<<<<< Updated upstream
}

=======
}*/

 
>>>>>>> Stashed changes
