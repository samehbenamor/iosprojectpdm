//
//  DescriptionView.swift
//  projectpmd
//
//  Created by Apple Esprit on 23/11/2023.
//
import SwiftUI
struct DescriptionView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Croissant rouge \nTunisien")
                .font(.title)
                .fontWeight(.bold)

            HStack(spacing: 4) {
                ForEach(0..<5) { _ in
                    Image("star")
                }

                Text("(4.9)")
                    .opacity(0.5)
                    .padding(.leading, 8)

                Spacer()
            }

            Text("Description")
                .fontWeight(.medium)
                .padding(.vertical, 8)

            Text("Le Mouvement international de la Croix-Rouge et du Croissant-Rouge est un réseau humanitaire mondial fort de quelque 80 millions de membres et volontaires qui s'emploient à venir en aide aux personnes confrontées à une catastrophe, à un conflit armé ou à des problèmes d'ordre sanitaire et social.")
                .lineSpacing(8.0)
                .opacity(0.6)

            HStack {
                // Minus and Plus Button code can be added here
            }
        }
    }
}
