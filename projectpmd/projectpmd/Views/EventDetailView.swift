//
//  EventDetailView.swift
//  projectpmd
//
//  Created by Apple Esprit on 7/11/2023.
//

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


struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailView()
    }
}
