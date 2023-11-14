//
//  UserModifyProfile.swift
//  projectpmd
//
//  Created by Apple Esprit on 9/11/2023.
//

import SwiftUI

struct UserModifyProfile: View {
    @State private var email: String = ""
    @State private var location: String = ""
   
    @State private var fullName: String = ""
    @State private var Bio: String = ""
    // Social medias
    @State private var facebook: String = ""
    @State private var instagram: String = ""
    @State private var linkedin: String = ""
    //
    @State private var phoneNumber: String = ""

    @State private var selectedImage: Image? = nil
    @State private var isImagePickerPresented: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    @State private var isEditing = false
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 20) {
                Text("Modifier profile")
                    .font(Font.custom("Aksara Bali Galang", size: 36))
                    .lineSpacing(100)
                    .foregroundColor(Color(red: 0.36, green: 0.70, blue: 0.36))
                
                
                
                TextField("Email", text: $email)
                
                    .padding(.horizontal)
                    .foregroundColor(.white)
                
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                    .frame(width: 402, height: 50)
                    .background(Color(red: 0.36, green: 0.70, blue: 0.36).opacity(0.5))
                    .foregroundColor(.white)
                    .cornerRadius(19)
                
                TextField("Profile bio", text: $Bio)
                
                    .padding(.horizontal)
                    .foregroundColor(.white)
                
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                    .frame(width: 402, height: 90)
                    .background(Color(red: 0.36, green: 0.70, blue: 0.36).opacity(0.5))
                    .foregroundColor(.white)
                    .cornerRadius(19)
                
                TextField("Full Name", text: $fullName)
                
                    .padding(.horizontal)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                    .frame(width: 402, height: 50)
                    .background(Color(red: 0.36, green: 0.70, blue: 0.36).opacity(0.5))
                    .foregroundColor(.white)
                    .cornerRadius(19)
              
                TextField("Location", text: $location)
                
                    .padding(.horizontal)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                    .frame(width: 402, height: 50)
                    .background(Color(red: 0.36, green: 0.70, blue: 0.36).opacity(0.5))
                    .foregroundColor(.white)
                    .cornerRadius(19)
                TextField("Facebook", text: $facebook)
                
                    .padding(.horizontal)
                    .foregroundColor(.white)
                
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                    .frame(width: 402, height: 50)
                    .background(Color(red: 0.36, green: 0.70, blue: 0.36).opacity(0.5))
                    .foregroundColor(.white)
                    .cornerRadius(19)
                TextField("Instagram", text: $instagram)
                
                    .padding(.horizontal)
                    .foregroundColor(.white)
                
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                    .frame(width: 402, height: 50)
                    .background(Color(red: 0.36, green: 0.70, blue: 0.36).opacity(0.5))
                    .foregroundColor(.white)
                    .cornerRadius(19)
                TextField("Linkedin", text: $linkedin)
                
                    .padding(.horizontal)
                    .foregroundColor(.white)
                
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                    .frame(width: 402, height: 50)
                    .background(Color(red: 0.36, green: 0.70, blue: 0.36).opacity(0.5))
                    .foregroundColor(.white)
                    .cornerRadius(19)
                TextField("Phone number", text: $phoneNumber)
                
                    .padding(.horizontal)
                    .foregroundColor(.white)
                
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                    .frame(width: 402, height: 50)
                    .background(Color(red: 0.36, green: 0.70, blue: 0.36).opacity(0.5))
                    .foregroundColor(.white)
                    .cornerRadius(19)
                
                
                
                
                
                
                
                
                
                
                
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 20)
            .edgesIgnoringSafeArea(.all)
            .background(colorScheme == .dark ? Color(red: 0.25, green: 0.24, blue: 0.26) : Color(red: 0.98, green: 0.97, blue: 0.93))
            
            Text("Choisir photo de profile")
                .font(Font.custom("Aksara Bali Galang", size: 18))
                .foregroundColor(colorScheme == .dark ? Color(.white) : Color(.black))
            HStack {
                if let image = selectedImage {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120, height: 120)
                } else {
                    Image(systemName: "photo.on.rectangle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                }
                
                Button(action: {
                    isImagePickerPresented = true
                }) {
                    Text("Choose Photo")
                        .font(Font.custom("Aksara Bali Galang", size: 18))
                        .foregroundColor(Color(red: 0.36, green: 0.70, blue: 0.36))
                }
                .sheet(isPresented: $isImagePickerPresented) {
                    ImagePicker(selectedImage: $selectedImage)
                }
            }
            .padding(.bottom, 20)
            Button(action: {
                // Add any action you want to perform here
                // This can be empty if you don't need to perform any additional action
            }) {
                NavigationLink(destination: UserProfileView()) {
                    Text("Modifier profile")
                        .font(Font.custom("Aksara Bali Galang", size: 24))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(red: 0.06, green: 0.56, blue: 0.08))
                        .cornerRadius(19)
                        .frame(width: 402, height: 50)
                  
                }
            }
            .padding(.bottom, 20)
            Button(action: {
                // Add any action you want to perform here
                // This can be empty if you don't need to perform any additional action
            }) {
                NavigationLink(destination: UserProfileView()) {
                    Text("Reset password")
                        .font(Font.custom("Aksara Bali Galang", size: 24))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(red: 0.87, green: 0.90, blue: 0.16))
                        .cornerRadius(19)
                        .frame(width: 402, height: 50)
                }
            }
            .padding(.bottom, 20)
            Button(action: {
                // Add any action you want to perform here
                // This can be empty if you don't need to perform any additional action
            }) {
                NavigationLink(destination: UserProfileView()) {
                    Text("Deactivate account")
                        .font(Font.custom("Aksara Bali Galang", size: 24))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(red: 0.89, green: 0.21, blue: 0.16))
                        .cornerRadius(19)
                        .frame(width: 402, height: 50)
                }
            }

            
            
        }
        .background(colorScheme == .dark ? Color(red: 0.25, green: 0.24, blue: 0.26) : Color(red: 0.98, green: 0.97, blue: 0.93))
    }
    
    
}

struct UserModifyProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserModifyProfile()
    }
}

