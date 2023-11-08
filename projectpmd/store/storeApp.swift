import SwiftUI

struct Product: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let price: Double
    let imageURL: String
}

struct ProductListView: View {
    @State private var products: [Product] = [
            Product(name: "Product 1", description: "20% to ...", price: 20, imageURL: "images-2"),
            Product(name: "Product 2", description: "Another great product", price: 30, imageURL: "images-3"),
            Product(name: "Product 3", description: "A third great product", price: 40, imageURL: "images-3"),
            Product(name: "Product 4", description: "Another great product", price: 30, imageURL: "images-4"),
            Product(name: "Product 5", description: "A third great product", price: 40, imageURL: "images-5"),
            Product(name: "Product 6", description: "Another great product", price: 30, imageURL: "images-6"),
            Product(name: "Product 7", description: "A third great product", price: 40, imageURL: "images-10"),
            Product(name: "Product 8", description: "Another great product", price: 30, imageURL: "images-8"),
            Product(name: "Product 9", description: "A third great product", price: 40, imageURL: "images-9"),
            Product(name: "Product 10", description: "Another great product", price: 30, imageURL: "images-11"),
    ]

    var body: some View {
        NavigationView {
            List(products) { product in
                NavigationLink(destination: ProductDetailView(product: product)) {
                    HStack {
                        Image(product.imageURL)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())

                        Text(product.name)
                            .font(.title2)
                    }
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                                    .frame(width: 280, height: 100)
                                    .background(Color(red: 0.36, green: 0.70, blue: 0.36).opacity(0.5))
                                    .foregroundColor(.white)
                                    .cornerRadius(30)
                                    
                                    .overlay(RoundedRectangle(cornerRadius: 24)
                                        .stroke(Color(red: 0.06, green: 0.56, blue: 0.08), lineWidth: 4)
                                    
                                    )
                }
            }
            .navigationBarTitle("Products")
        

        .navigationBarItems(trailing:
                       Button("Add Product") {
                           // Add product action
                       }
                       .padding()
                       .foregroundColor(.white)
                       .background(Color(red: 0.36, green: 0.70, blue: 0.36).opacity(1))
                       .cornerRadius(5)
                   )
               }

        

        .background(Color.green.opacity(0.5))

            
        }

            
    }

struct AddProductView: View {
    @State private var productName: String = ""
    @State private var productDescription: String = "" // Declare productDescription
    @State private var productPrice: Double = 0.0
    @State private var productImageURL: String = ""

    var body: some View {
        Form {
            Section("Product Information") {
                TextField("Product Name", text: $productName)
                TextField("Product Description", text: $productDescription) // Use productDescription
                TextField("Product Price", value: $productPrice, formatter: NumberFormatter())
                TextField("Product Image URL", text: $productImageURL)
            }
        }
        .padding()

        // Move the navigationBarItems outside the Form
        .navigationBarItems(trailing:
            NavigationLink(destination: ProductDetailView(product: Product(name: productName, description: productDescription, price: productPrice, imageURL: productImageURL))) {
                Button("Add") {
                    // Add product action
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(5)
            }
        )
    }
}




struct ProductDetailView: View {
    public init(product: Product) {
        self.product = product
    }
    
    private var product: Product
    
    var body: some View {ScrollView{        VStack {
        
        Spacer() // Add a Spacer to push the content to the bottom
        
        Image(product.imageURL)
            .resizable()
            .frame(width: 200, height: 200)
            
        Text(product.name)
            .font(.title)
            .padding()
            .foregroundColor(Color.white)
        Text("Price: $\(product.price)")
            .font(.title2)
            .padding()
            .foregroundColor(Color.white)
            .padding()
        
        Text(product.description)
            .padding()
            .foregroundColor(Color.white)
            .padding()
            .frame(width: 500, height: 50)
        
            .navigationBarItems(trailing:
                                    Button("buy") {
                // Add product action
            }
                .padding()
                .foregroundColor(.white)
                .background(Color(red: 0.36, green: 0.70, blue: 0.36).opacity(1))
                .cornerRadius(5)
            )
        
           
    }}
        .navigationBarTitle(product.name)
        .background(Color(red: 0.36, green: 0.70, blue: 0.36).opacity(0.5))
    }
    
    
    @main
    struct StoreApp: App {
        var body: some Scene {
            WindowGroup {
                ProductListView()
            }
        }
    }
    
    struct StoreApp_Previews: PreviewProvider {
        static var previews: some View {
            ProductListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
    
}
