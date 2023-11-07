import SwiftUI
import UIKit

struct Cree_evntView: View {
    @State private var eventName = ""
    @State private var eventDate = Date()
    @State private var eventTime = Date()
    @State private var textwhats = ""
    @State private var eventLocation = "En personne"
    @State private var eventNames = ""
    @State private var eventdesc = ""
    
    @State private var selectedImage: Image? = nil
    @State private var isImagePickerPresented: Bool = false
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack {
                
                
                
                
                TextField("Nom de l'événement", text: $eventName)
                    .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
                                    .frame(width: 380, height: 66)
                                    .background(Color(red: 0.36, green: 0.70, blue: 0.36).opacity(0.5))
                                    .foregroundColor(.white)
                                    .cornerRadius(19)
                                    .overlay(RoundedRectangle(cornerRadius: 24)
                                        .stroke(Color(red: 0.06, green: 0.56, blue: 0.08), lineWidth: 4)
                                       
                                    ).padding(.top)
                
                
                
                
    
                DatePicker("Date de début", selection: $eventDate, displayedComponents: .date)
                    .datePickerStyle(DefaultDatePickerStyle())
                    .padding()
                    .frame(width: 380, height: 66)
                    .cornerRadius(19)
                    
                    .background(Color(red: 0.36, green: 0.70, blue: 0.36).opacity(0.5))

                
                
                DatePicker("Date de début", selection: $eventDate, displayedComponents: .date)
                    .datePickerStyle(DefaultDatePickerStyle())
                    .padding()
                    .frame(width: 380, height: 66)
                    .background(Color(red: 0.36, green: 0.70, blue: 0.36).opacity(0.5))

                
                Picker("Emplacement de l'événement", selection: $eventLocation) {
                    Text("En personne").tag("En personne")
                    Text("Virtuel").tag("Virtuel")
                }
                
                .padding()
                
                
                
                
                
                
                
                TextField("Ajouter une invitation à rejoindre un groupe WhatsApp", text: $eventdesc)
                    .frame(width: 380, height: 66)
                    .background(Color(red: 0.36, green: 0.70, blue: 0.36).opacity(0.5))
                    .foregroundColor(.white)
                    .cornerRadius(19)
                    .overlay(RoundedRectangle(cornerRadius: 24)
                        .stroke(Color(red: 0.06, green: 0.56, blue: 0.08), lineWidth: 4)
                       
                    )

                TextField("Détail", text: $textwhats)
                    .frame(width: 380, height: 66)
                    .background(Color(red: 0.36, green: 0.70, blue: 0.36).opacity(0.5))
                    .foregroundColor(.white)
                    .cornerRadius(19)
                    .overlay(RoundedRectangle(cornerRadius: 24)
                        .stroke(Color(red: 0.06, green: 0.56, blue: 0.08), lineWidth: 4)
                       
                    )

                
                if let image = selectedImage {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                }
                Image(systemName: "photo.on.rectangle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .onTapGesture {
                        isImagePickerPresented = true
                    }
                    .sheet(isPresented: $isImagePickerPresented) {
                        ImagePicker(selectedImage: $selectedImage)
                    }
                
                Spacer()
                
                Button(action: {
                    // Code pour créer un événement en utilisant les valeurs des champs, y compris l'image sélectionnée
                    // Vous pouvez ajouter ici la logique de création de l'événement
                    // Par exemple, enregistrez les données dans une base de données, puis fermez la vue
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Créer un événement")
                        .font(.headline)
                        .padding()
                        .background(Color(red: 0.36, green: 0.7, blue: 0.36))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
            .navigationBarTitle("Créer un événement", displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark")
                        .imageScale(.medium)
                        .frame(width: 30, height: 30)
                }
            )
        }
    }
}

struct Cree_evntView_Previews: PreviewProvider {
    static var previews: some View {
        Cree_evntView()
    }
}

// ImagePicker View
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
