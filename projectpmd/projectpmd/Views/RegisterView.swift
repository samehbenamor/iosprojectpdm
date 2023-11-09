import SwiftUI

struct RegisterView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var passwordVerify: String = ""
    @State private var fullName: String = ""
    @State private var dateOfBirth = Date()
    @State private var selectedImage: Image? = nil
    @State private var isImagePickerPresented: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    @State private var isEditing = false
    
    var body: some View {
      
            ScrollView {
                VStack(spacing: 20) {
                    Text("S'inscrire")
                        .font(Font.custom("Aksara Bali Galang", size: 36))
                        .lineSpacing(100)
                        .foregroundColor(Color(red: 0.36, green: 0.70, blue: 0.36))
                    
                    Text("Créez un compte pour explorer les différentes façons de contribuer à un meilleur environnement.")
                        .font(Font.custom("Aksara Bali Galang", size: 16))
                        .lineSpacing(10)
                        .foregroundColor(colorScheme == .dark ? Color(.white) : Color(.black))
                        .multilineTextAlignment(.center)
                    
                    TextField("Email", text: $email)
                        
                        .padding(.horizontal)
                        .foregroundColor(.white)
                        
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                                    .frame(width: 402, height: 50)
                                    .background(Color(red: 0.36, green: 0.70, blue: 0.36).opacity(0.5))
                                    .foregroundColor(.white)
                                    .cornerRadius(19)
                    
                    SecureField("Password", text: $password)
                        
                        .padding(.horizontal)
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                                    .frame(width: 402, height: 50)
                                    .background(Color(red: 0.36, green: 0.70, blue: 0.36).opacity(0.5))
                                    .foregroundColor(.white)
                                    .cornerRadius(19)
                    SecureField("Verify Password", text: $passwordVerify)
                        
                        .padding(.horizontal)
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                                    .frame(width: 402, height: 50)
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
                    
                    DatePicker("Date of Birth", selection: $dateOfBirth, displayedComponents: .date)
                        .labelsHidden()
                       
                        .datePickerStyle(WheelDatePickerStyle())
                        .padding(.horizontal)
                        .background(Color(red: 0.36, green: 0.70, blue: 0.36).opacity(0.5))
                        .cornerRadius(19)
                        
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
                   
                    Button(action: {
                        // Add the action you want the button to perform here
                    }) {
                        NavigationLink(destination: RoleView()) {
                            Text("S'inscrire")
                                .font(Font.custom("Aksara Bali Galang", size: 24))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color(red: 0.06, green: 0.56, blue: 0.08))
                                .cornerRadius(19)
                                .frame(width: 402, height: 50)
                        }
                    }
                    
                    
                      
                    
                }
                .padding(.vertical, 50)
                .padding(.horizontal, 20)
                .edgesIgnoringSafeArea(.all)
                .background(colorScheme == .dark ? Color(red: 0.25, green: 0.24, blue: 0.26) : Color(red: 0.98, green: 0.97, blue: 0.93))
            }
            .background(colorScheme == .dark ? Color(red: 0.25, green: 0.24, blue: 0.26) : Color(red: 0.98, green: 0.97, blue: 0.93))
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
