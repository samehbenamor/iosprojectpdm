//
//  DetailScreen.swift
//  projectpmd
//
//  Created by Apple Esprit on 8/11/2023.
//

import SwiftUI

struct DetailScreen: View {
   
        @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
        var body: some View {
            ZStack {
                Color("Bg")
                ScrollView  {
                    //            Product Image
                    
                        Image("photo_4")
                            .resizable()
                            .aspectRatio(1,contentMode: .fit)
                            .edgesIgnoringSafeArea(.top)
                    
                    DescriptionView()
                    
                }
                .edgesIgnoringSafeArea(.top)
                
                HStack {
                    Text("$1299")
                        .font(.title)
                        .foregroundColor(.white)
                    Spacer()
                    
                    Text("Je soutiens ce projet")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("Primary"))
                        .padding()
                        .padding(.horizontal, 8)
                        .background(Color.white)
                        .cornerRadius(10.0)
                    
                }
                .padding()
                .padding(.horizontal)
                .background(Color("Primary"))
                .cornerRadius(60.0, corners: .topLeft)
                .frame(maxHeight: .infinity, alignment: .bottom)
                .edgesIgnoringSafeArea(.bottom)
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: BackButton(action: {presentationMode.wrappedValue.dismiss()}), trailing: Image("threeDot"))
        }
    }


    struct RoundedCorner: Shape {

        var radius: CGFloat = .infinity
        var corners: UIRectCorner = .allCorners

        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            return Path(path.cgPath)
        }
    }

    extension View {
        func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
            clipShape( RoundedCorner(radius: radius, corners: corners) )
        }
    }

 

    

    struct DescriptionView: View {
        var body: some View {
            VStack (alignment: .leading) {
                //                Title
                Text("Croissant rouge \nTunisien")
                    .font(.title)
                    .fontWeight(.bold)
                //                Rating
                HStack (spacing: 4) {
                    ForEach(0 ..< 5) { item in
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
                Text("Le Mouvement international de la Croix-Rouge et du Croissant-Rouge est un réseau humanitaire mondial fort de quelque 80 millions de membres et volontaires qui s'emploient à venir en aide aux personnes confrontées à une catastrophe, à un conflit armé ou à des problèmes d'ordre sanitaire et social. ")
                    .lineSpacing(8.0)
                    .opacity(0.6)
                    
                //                Info
                
                
                //                Colors and Counter
               
                    HStack {
                        //                        Minus Button
                        Button(action: {}) {
                            Image(systemName: "minus")
                                .padding(.all, 8)
                            
                        }
                        .frame(width: 30, height: 30)
                        .overlay(RoundedCorner(radius: 50).stroke())
                        .foregroundColor(.black)
                        
                        Text("1")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 8)
                            
                        //                        Plus Button
                        Button(action: {}) {
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                                .padding(.all, 8)
                                .background(Color("Primary"))
                                .clipShape(Circle())
                        }
                    }
                    
                }
            }
          
            
          
           
        }



    struct BackButton: View {
        let action: () -> Void
        var body: some View {
            Button(action: action) {
                Image(systemName: "chevron.backward")
                    .foregroundColor(.black)
                    .padding(.all, 12)
                    .background(Color.white)
                    .cornerRadius(8.0)
            }
        }
    }


struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen()
    }
}
