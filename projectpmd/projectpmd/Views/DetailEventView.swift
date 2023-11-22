//
//  DetailEventView.swift
//  projectpmd
//
//  Created by Apple Esprit on 21/11/2023.
//
/*
import SwiftUI

struct DetailEventView: View {

    @State var events: [Event] = [] // Assurez-vous d'avoir une structure Event similaire à celle que vous avez utilisée précédemment

        @State private var isInterested = false

    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            List(events) { event in
                
                VStack(alignment: .leading) {
                    AsyncImageView(url: event.imageURL)
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
            }
            }
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
                                  
                                }
    
   



struct DetailEventView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEventView()
    }
}
*/
