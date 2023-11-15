//
//  myEventsView.swift
//  projectpmd
//
//  Created by Mac-Mini-2021 on 13/11/2023.
//

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
                    }
                }
            }
            .navigationBarTitle("Mes Événements")
            
        }
        }
    
    
    
}


struct MyEventsView_Previews: PreviewProvider {
    static var previews: some View {
        MyEventsView()
    }
}

