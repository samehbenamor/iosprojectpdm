//
//  RegisterView.swift
//  projectpmd
//
//  Created by Apple Esprit on 7/11/2023.
//

import SwiftUI
import UIKit
struct RegisterView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var passwordVerify: String = ""
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var phoneNumber: String = ""
    @State private var dateOfBirth = Date()
    @State private var selectedImage: Image? = nil
    @State private var isImagePickerPresented: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    @State private var isEditing = false
    var body: some View {
        NavigationView {
            ScrollView {
        ZStack() {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 430, height: 932)
                .background(colorScheme == .dark ? Color(red: 0.25, green: 0.24, blue: 0.26) : Color(red: 0.98, green: 0.97, blue: 0.93))
                .offset(x: 0, y: 3)
            Text("S'inscrire")
                .font(Font.custom("Aksara Bali Galang", size: 36))
                .lineSpacing(100)
                .foregroundColor(Color(red: 0.36, green: 0.70, blue: 0.36))
                .offset(x: 0, y: -400)
            Text("Créez un compte pour explorer les différentes \n façons de contribuer à un meilleur environnement.")
                .font(Font.custom("Aksara Bali Galang", size: 16))
                .lineSpacing(10)
                .foregroundColor(colorScheme == .dark ? Color(.white) : Color(.black))
                .multilineTextAlignment(.center)
                .offset(x: -0.50, y: -340)
            
            
            ZStack(alignment: .leading) {
                TextField("", text: $email, onEditingChanged: { editing in
                    withAnimation {
                        self.isEditing = editing
                    }
                })
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                .frame(width: 402, height: 66)
                .background(Color(red: 0.36, green: 0.70, blue: 0.36).opacity(0.5))
                .foregroundColor(.white)
                .cornerRadius(19)
                
                .overlay(RoundedRectangle(cornerRadius: 24)
                    .stroke(Color(red: 0.06, green: 0.56, blue: 0.08), lineWidth: 4)
                         
                    .opacity(isEditing && !email.isEmpty ? 1 : 0)
                )
                
                if email.isEmpty {
                    Text("Email")
                        .foregroundColor(.white)
                        .padding(.horizontal, 19)
                    
                        .background(Color.clear)
                        .offset(x: 16, y: -8)
                }
            }
            .offset(x: 0, y: -270)
            
            ZStack(alignment: .leading) {
                SecureField("", text: $password)
                
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                    .frame(width: 402, height: 66)
                    .background(Color(red: 0.36, green: 0.70, blue: 0.36).opacity(0.5))
                    .foregroundColor(.white)
                    .cornerRadius(19)
                
                    .overlay(RoundedRectangle(cornerRadius: 24)
                        .stroke(Color(red: 0.06, green: 0.56, blue: 0.08), lineWidth: 4)
                             
                        .opacity(password.isEmpty ? 0 : 1)
                    )
                
                if password.isEmpty {
                    Text("Password")
                        .foregroundColor(.white)
                        .padding(.horizontal, 19)
                    
                        .background(Color.clear)
                        .offset(x: 16, y: -8)
                }
            }
            .offset(x: 0, y: -190)
            
            ZStack(alignment: .leading) {
                SecureField("", text: $passwordVerify)
                
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                    .frame(width: 402, height: 66)
                    .background(Color(red: 0.36, green: 0.70, blue: 0.36).opacity(0.5))
                    .foregroundColor(.white)
                    .cornerRadius(19)
                
                    .overlay(RoundedRectangle(cornerRadius: 24)
                        .stroke(Color(red: 0.06, green: 0.56, blue: 0.08), lineWidth: 4)
                             
                        .opacity(passwordVerify.isEmpty ? 0 : 1)
                    )
                
                if passwordVerify.isEmpty {
                    Text("Verify password")
                        .foregroundColor(.white)
                        .padding(.horizontal, 19)
                    
                        .background(Color.clear)
                        .offset(x: 16, y: -8)
                }
            }
            .offset(x: 0, y: -110)
            
            ZStack(alignment: .leading) {
                TextField("", text: $firstName, onEditingChanged: { editing in
                    withAnimation {
                        self.isEditing = editing
                    }
                })
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                .frame(width: 402, height: 66)
                .background(Color(red: 0.36, green: 0.70, blue: 0.36).opacity(0.5))
                .foregroundColor(.white)
                .cornerRadius(19)
                
                .overlay(RoundedRectangle(cornerRadius: 24)
                    .stroke(Color(red: 0.06, green: 0.56, blue: 0.08), lineWidth: 4)
                         
                    .opacity(isEditing && !firstName.isEmpty ? 1 : 0)
                )
                
                if firstName.isEmpty {
                    Text("First Name")
                        .foregroundColor(.white)
                        .padding(.horizontal, 19)
                    
                        .background(Color.clear)
                        .offset(x: 16, y: -8)
                }
            }
            .offset(x: 0, y: -30)
            
            ZStack(alignment: .leading) {
                TextField("", text: $lastName, onEditingChanged: { editing in
                    withAnimation {
                        self.isEditing = editing
                    }
                })
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                .frame(width: 402, height: 66)
                .background(Color(red: 0.36, green: 0.70, blue: 0.36).opacity(0.5))
                .foregroundColor(.white)
                .cornerRadius(19)
                
                .overlay(RoundedRectangle(cornerRadius: 24)
                    .stroke(Color(red: 0.06, green: 0.56, blue: 0.08), lineWidth: 4)
                         
                    .opacity(isEditing && !lastName.isEmpty ? 1 : 0)
                )
                
                if lastName.isEmpty {
                    Text("Last Name")
                        .foregroundColor(.white)
                        .padding(.horizontal, 19)
                        .zIndex(100)
                        .background(Color.clear)
                        .offset(x: 16, y: -8)
                }
                
                DatePicker("", selection: $dateOfBirth, displayedComponents: .date)
                    .labelsHidden()
                    .zIndex(100)
                    .datePickerStyle(WheelDatePickerStyle())
                    .frame(width: 402, height: 66)
                    .background(Color(red: 0.36, green: 0.70, blue: 0.36).opacity(0.5))
                    .cornerRadius(19)
                    .padding(.leading, 14)
                    .offset(x: -15, y: 80)
                
            }
            
            .offset(x: 6, y: 50)
            
            
            ZStack(alignment: .leading) {
                TextField("", text: $phoneNumber, onEditingChanged: { editing in
                    withAnimation {
                        self.isEditing = editing
                    }
                })
                .keyboardType(.numberPad)
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                .frame(width: 402, height: 66)
                .background(Color(red: 0.36, green: 0.70, blue: 0.36).opacity(0.5))
                .foregroundColor(.white)
                .cornerRadius(19)
                
                .overlay(RoundedRectangle(cornerRadius: 24)
                    .stroke(Color(red: 0.06, green: 0.56, blue: 0.08), lineWidth: 4)
                         
                    .opacity(isEditing && !phoneNumber.isEmpty ? 1 : 0)
                )
                
                if phoneNumber.isEmpty {
                    Text("Phone Number")
                        .foregroundColor(.white)
                        .padding(.horizontal, 19)
                    
                        .background(Color.clear)
                        .offset(x: 16, y: -8)
                }
            }
            .offset(x: 0, y: 210)
          
    
            
            
            ZStack(alignment: .leading) {
                Text("Choisir photo de profile")
                    .font(Font.custom("Aksara Bali Galang", size: 18))
                    .foregroundColor(colorScheme == .dark ? Color(.white) : Color(.black))
                    .offset(x: 0, y: 290)
                if let image = selectedImage {
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 120, height: 120)
                                        .offset(x: 280, y: 290)
                                }
                                
                                Image(systemName: "photo.on.rectangle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 30, height: 30)
                                    .offset(x: 200, y: 290)
                                    .onTapGesture {
                                        isImagePickerPresented = true
                                    }
                                    .sheet(isPresented: $isImagePickerPresented) {
                                        ImagePicker(selectedImage: $selectedImage)
                                    }
                Button(action: {
                    // Add the action you want the button to perform here
                }) {
                    NavigationLink(destination: RoleView()) {
                    Text("S'inscrire")
                        .font(Font.custom("Aksara Bali Galang", size: 24))
                        .foregroundColor(.white)
                    }
                }
                .frame(width: 402, height: 66)
                .background(Color(red: 0.06, green: 0.56, blue: 0.08))
                .cornerRadius(19)
                .offset(x: 0, y: 370)
                NavigationLink(destination: LoginView()) {
                Text("Vous avez déjà un compte")
                    .font(Font.custom("Aksara Bali Galang", size: 20))
               
                    .foregroundColor(Color(red: 0.90, green: 0.21, blue: 0.16))
                    .offset(x: 80, y: 430)
                }
            }
            
            
        }
        .frame(width: 430, height: 850)
        .background(.white)
                
    }
            .background(colorScheme == .dark ? Color(red: 0.25, green: 0.24, blue: 0.26) : Color(red: 0.98, green: 0.97, blue: 0.93))
          
        }
        
        
    }
    
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
    
}
struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: Image?
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.selectedImage = Image(uiImage: uiImage)
            }
            picker.dismiss(animated: true, completion: nil)
        }
    }
}
