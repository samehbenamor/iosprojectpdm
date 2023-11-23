//
//  DetailScreen.swift
//  projectpmd
//
//  Created by Apple Esprit on 8/11/2023.
//

import SwiftUI



struct DetailScreen: View {

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @State private var isPaiementViewPresented = false

    // Assume you have an array of image names

    let imageNames = ["image_1", "image_2", "image_3", "image_4"]



    var body: some View {

        NavigationView {

            ScrollView(.vertical, showsIndicators: false) {

                VStack {

                    ScrollView(.horizontal, showsIndicators: false) {

                        HStack(spacing: 0) {

                            ForEach(imageNames, id: \.self) { imageName in

                                Image(imageName)

                                    .resizable()

                                    .aspectRatio(contentMode: .fit)

                                    .frame(width: UIScreen.main.bounds.width)

                                    .edgesIgnoringSafeArea(.top)

                            }

                        }

                    }

                    .edgesIgnoringSafeArea(.top) // Adjusted to ignore safe area at the top



                    VStack(alignment: .leading) {

                        DescriptionView()

                            .padding()



                        HStack {

                            Text("$1299")

                                .font(.title)

                                .foregroundColor(.white)



                            Spacer()



                            Button(action: {

                                // Add your action here

                                isPaiementViewPresented = true



                            }) {

                                Text("Je soutiens ce projet")

                                    .font(.title3)

                                    .fontWeight(.semibold)

                                    .foregroundColor(Color("Primary"))

                                    .padding()

                                    .padding(.horizontal, 8)

                                    .background(Color.white)

                                    .cornerRadius(10.0)

                            }

                            .sheet(isPresented: $isPaiementViewPresented) {

                                PaiementView()

                            }

                        }

                        .padding()

                        .padding(.horizontal)

                        .background(Color("Primary"))

                        .cornerRadius(10.0, corners: .topLeft)

                    }

                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)

                    .edgesIgnoringSafeArea(.bottom)

                }

            }

            .navigationBarBackButtonHidden(true)

            .navigationBarItems(

                leading: Button(action: { presentationMode.wrappedValue.dismiss() }) {

                    Image(systemName: "arrow.left.circle.fill")

                        .foregroundColor(.white)

                        .imageScale(.large)

                },

                trailing: Image("yourCustomImageName")

            )

        }

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

                      
                        

                            

                        //                        Plus Button

                        

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

