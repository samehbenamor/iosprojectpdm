//
//  HomeScreen.swift
//  projectpmd
//
//  Created by Apple Esprit on 7/11/2023.
//
import SwiftUI



struct Product {

    let image: Image

    let size: CGFloat

    let title: String

    let price: String

}





struct HomeScreen: View {

    @State private var search: String = ""

    @State private var selectedIndex: Int = 1



    let products: [Product] = [

        Product(image: Image("photo_1"), size: 180, title: "Product 1", price: "$999"),

        Product(image: Image("photo_2"), size: 180, title: "Product 2", price: "$1299"),

        Product(image: Image("photo_3"), size: 180, title: "Product 3", price: "$1499"),

        Product(image: Image("photo_4"), size: 180, title: "Product 4", price: "$1599")

    ]



    var body: some View {

        NavigationView {

            ZStack {

                Color(#colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1))

                    .ignoresSafeArea()



                ScrollView(showsIndicators: false) {

                    VStack(alignment: .leading) {



                        AppBarView()



                        TagLineView()

                            .padding()



                        SearchAndScanView(search: $search)



                        Text("Popular")

                            .font(.custom("PlayfairDisplay-Bold", size: 24))

                            .padding(.horizontal)



                        ScrollView(.horizontal, showsIndicators: false) {

                            HStack(spacing: 0) {

                                ForEach(products, id: \.title) { product in

                                    ProductCardView(

                                        image: product.image,

                                        size: product.size,

                                        title: product.title,

                                        price: product.price

                                    )
                                }
                            }

                        }

                        .padding(.bottom)



                        Text("Best")

                            .font(.custom("PlayfairDisplay-Bold", size: 24))

                            .padding(.horizontal)



                        ScrollView(.horizontal, showsIndicators: false) {

                            HStack(spacing: 0) {

                                ForEach(0 ..< 4) { i in

                                    ProductCardView( image: Image("photo_4"),

                                                     size: 210,

                                                     title: "Your Title",

                                                     price: "$YourPrice")

                                }

                            }

                        }



                    }

                }



                VStack {

                    Spacer()

                    BottomNavBarView()

                }

            }

        }

    }

}



struct HomeScreen_Previews: PreviewProvider {

    static var previews: some View {

        HomeScreen()

    }

}













struct AppBarView: View {

    var body: some View {

        HStack {

            Button(action: {}) {

                Image("menu")

                    .padding()

                    .background(Color.white)

                    .cornerRadius(10.0)

            }

            

            Spacer()

            

           

        }

        .padding(.horizontal)

    }

}



struct TagLineView: View {

    var body: some View {

        Text("Find the \nBest ")

            .font(.custom("NimbusSanL-Bol", size: 28))

            .foregroundColor(Color("Primary"))

            + Text("Projet!")

            .font(.custom("PlayfairDisplay-Bold", size: 28))

            .fontWeight(.bold)

            .foregroundColor(Color("Primary"))

    }

}



struct SearchAndScanView: View {

    @Binding var search: String

    var body: some View {

        HStack {

            HStack {

                Image("Search")

                    .padding(.trailing, 8)

                TextField("Search projet", text: $search)

            }

            .padding(.all, 20)

            .background(Color.white)

            .cornerRadius(10.0)

            .padding(.trailing, 8)

            

            

        }

        .padding(.horizontal)

        

        

    }

}







struct ProductCardView: View {

    let image: Image

        let size: CGFloat

        let title: String

        let price: String



        var body: some View {

            NavigationLink(destination: DetailScreen()) {

                VStack {

                    image

                        .resizable()

                        .frame(width: size, height: 200 * (size / 210))

                        .cornerRadius(20.0)

                    Text(title)

                        .font(.title3)

                        .fontWeight(.bold)



                    HStack(spacing: 2) {

                        ForEach(0 ..< 5) { item in

                            Image("star")

                        }

                        Spacer()

                        Text(price)

                            .font(.title3)

                            .fontWeight(.bold)

                    }

                }

                .frame(width: size)

                .padding()

                .background(Color.white)

                .cornerRadius(20.0)

            }
            .padding(.horizontal, 8)
        }

    

}





struct BottomNavBarView: View {

    var body: some View {

        HStack {

            BottomNavBarItem(image: Image("Home"), action: {})

            

            BottomNavBarItem(image: Image("User"), action: {})

        }

        .padding()

        .background(Color.white)

        .clipShape(Capsule())

        .padding(.horizontal)

        .shadow(color: Color.blue.opacity(0.15), radius: 8, x: 2, y: 6)

    }

}



struct BottomNavBarItem: View {

    let image: Image

    let action: () -> Void

    var body: some View {

        Button(action: action) {

            image

                .frame(maxWidth: .infinity)

        }

    }

}

