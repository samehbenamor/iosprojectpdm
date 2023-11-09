//
//  RoleView.swift
//  projectpmd
//
//  Created by Apple Esprit on 7/11/2023.
//

import SwiftUI

struct RoleView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
       
        ZStack() {
            Button(action: {
                // Add the action you want the button to perform here
            }) {
                NavigationLink(destination: UserProfileView()) {
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 430, height: 466)
                        .background(Color(red: 0.36, green: 0.70, blue: 0.36))
                        .offset(x: 0, y: -250)
                    
                    VStack {
                        Text("Contributeur")
                            .font(Font.custom("Aksara Bali Galang", size: 48))
                            .lineSpacing(38)
                            .foregroundColor(colorScheme == .dark ? Color(red: 0.25, green: 0.24, blue: 0.26) : Color(.white))
                            .offset(x: 0, y: -339)
                        
                        Text("Vous avez à cœur de contribuer aux différents projets présentés par les organisations dans cette application ! Vous pourrez contribuer à des œuvres de bienfaisance, commenter des blogs, accéder à diverses vidéos éducatives et bien plus encore !")
                            .font(Font.custom("Aksara Bali Galang", size: 14))
                            .lineSpacing(10)
                            .multilineTextAlignment(.center)
                            .foregroundColor(colorScheme == .dark ? Color(red: 0.25, green: 0.24, blue: 0.26) : Color(.white))
                            .offset(x: 0, y: -250)
                    }
                }
            }
            }

            Button(action: {
                // Add the action you want the button to perform here
            }) {
                NavigationLink(destination: UserProfileView()) {
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 500, height: 400)
                        .background(Color(red: 0.90, green: 0.21, blue: 0.16))
                        .offset(x: 0, y: 233)
                    
                    VStack {
                        Text("Organisateur")
                            .font(Font.custom("Aksara Bali Galang", size: 48))
                            
                            .foregroundColor(colorScheme == .dark ? Color(red: 0.25, green: 0.24, blue: 0.26) : Color(.white))
                            .offset(x: 0, y: 171)
                        
                        Text("Vous avez à cœur de contribuer aux différents projets présentés par les organisations dans cette application ! Vous pourrez contribuer à des œuvres de bienfaisance, commenter des blogs, accéder à diverses vidéos éducatives et bien plus encore !")
                            .font(Font.custom("Aksara Bali Galang", size: 14))
                            .lineSpacing(10)
                            .multilineTextAlignment(.center)
                            .foregroundColor(colorScheme == .dark ? Color(red: 0.25, green: 0.24, blue: 0.26) : Color(.white))
                            .offset(x: 0, y: 250)
                    }
                }
            }
            }

            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 430, height: 109)
                .background(colorScheme == .dark ? Color(red: 0.25, green: 0.24, blue: 0.26) : Color(.white) )
                .offset(x: 0, y: -0.50)
            
            
            Text("Et vous êtes ?")
                .font(Font.custom("Aksara Bali Galang", size: 48))
                .lineSpacing(82)
                .foregroundColor(colorScheme == .dark ? Color(.white) : Color(red: 0.25, green: 0.24, blue: 0.26) )
                .offset(x: 0, y: 0)
        }
        .frame(width: 430, height: 932)
        .background(.white)
    
    }
}

struct RoleView_Previews: PreviewProvider {
    static var previews: some View {
        RoleView()
    }
}
