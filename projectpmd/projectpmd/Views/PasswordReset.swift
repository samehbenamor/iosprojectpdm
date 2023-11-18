//
//  PasswordReset.swift
//  projectpmd
//
//  Created by Apple Esprit on 9/11/2023.
//

import SwiftUI

struct PasswordReset: View {
    @State private var email: String = ""
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        VStack(spacing: 10) {
            Text("Password reset")
                .font(Font.custom("Aksara Bali Galang", size: 24))
                .lineSpacing(100)
                .foregroundColor(Color(red: 0.36, green: 0.70, blue: 0.36))
                .offset(x: 0, y:-150)
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 202, height: 202)
                .background(
                    Image("Forgotpass2")
                            .resizable()
                            .frame(width: 202, height: 202)
                )
                .offset(x: 0, y:-120)
            Text("Reset password")
                .font(Font.custom("Aksara Bali Galang", size: 24))
                .lineSpacing(53)
                .foregroundColor(Color(red: 0.36, green: 0.70, blue: 0.36))
                .offset(x: 0, y:-120)
            Text("What would you like your new password to be?")
                .multilineTextAlignment(.center)
                .font(Font.custom("Aksara Bali Galang", size: 16))
                .lineSpacing(10)
                .foregroundColor(colorScheme == .dark ? .white : Color(red: 0.25, green: 0.24, blue: 0.26))
                .offset(x: 0, y:-80)
            TextField("Password", text: $email)
                
                .padding(.horizontal)
                .foregroundColor(.white)
                
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                            .frame(width: 402, height: 50)
                            .background(Color(red: 0.36, green: 0.70, blue: 0.36).opacity(0.5))
                            .foregroundColor(.white)
                            .cornerRadius(19)
            TextField("Password verify", text: $email)
                
                .padding(.horizontal)
                .foregroundColor(.white)
                
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                            .frame(width: 402, height: 50)
                            .background(Color(red: 0.36, green: 0.70, blue: 0.36).opacity(0.5))
                            .foregroundColor(.white)
                            .cornerRadius(19)
            
            Button(action: {
                // Add the action you want the button to perform here
            }) {
                NavigationLink(destination: EmailSent(verifyModel: VerificationViewModel())) {
                    Text("Reset")
                        .font(Font.custom("Aksara Bali Galang", size: 24))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(red: 0.06, green: 0.56, blue: 0.08))
                        .cornerRadius(19)
                        .frame(width: 402, height: 50)
                }
            }
            .offset(x: 0, y:120)
        }
        .frame(width: 430, height: 932)
        .background(colorScheme == .dark ? Color(red: 0.25, green: 0.24, blue: 0.26) : Color(red: 0.98, green: 0.97, blue: 0.93))
    }
}

struct PasswordReset_Previews: PreviewProvider {
    static var previews: some View {
        PasswordReset()
    }
}
