//
//  EmailSent.swift
//  projectpmd
//
//  Created by Apple Esprit on 9/11/2023.
//

import SwiftUI

struct EmailSent: View {
    @State private var email: String = ""
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        VStack(spacing: 20) {
            Text("Lien envoyé")
                .font(Font.custom("Aksara Bali Galang", size: 24))
                .lineSpacing(100)
                .foregroundColor(Color(red: 0.36, green: 0.70, blue: 0.36))
                .offset(x: 0, y:-150)
           
            Text("Check your email!")
                .font(Font.custom("Aksara Bali Galang", size: 40))
                .lineSpacing(53)
                .foregroundColor(Color(red: 0.36, green: 0.70, blue: 0.36))
                .offset(x: 0, y:-120)
            Text("Nous venons de vous envoyer un lien pour réinitialiser votre mot de passe !")
                .multilineTextAlignment(.center)
                .font(Font.custom("Aksara Bali Galang", size: 16))
                .lineSpacing(10)
                .padding(.horizontal)
                .foregroundColor(colorScheme == .dark ? .white : Color(red: 0.25, green: 0.24, blue: 0.26))
                .offset(x: 0, y:-80)
            
            
            
            Button(action: {
                // Add the action you want the button to perform here
            }) {
                NavigationLink(destination: LoginView()) {
                    Text("Login")
                        .font(Font.custom("Aksara Bali Galang", size: 24))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(red: 0.06, green: 0.56, blue: 0.08))
                        .cornerRadius(19)
                        .frame(width: 402, height: 50)
                        
                }
            }
            .offset(x: 0, y:250)
        }
        .frame(width: 430, height: 932)
        .background(colorScheme == .dark ? Color(red: 0.25, green: 0.24, blue: 0.26) : Color(red: 0.98, green: 0.97, blue: 0.93))
    }
}

struct EmailSent_Previews: PreviewProvider {
    static var previews: some View {
        EmailSent()
    }
}
