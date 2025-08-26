import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ProductsViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                List(viewModel.products) { product in
                    NavigationLink(destination: ProductDetailView(product: product)) {
                        HStack {
                            Text(product.name)
                                .font(.headline)
                            
                            Spacer()
                            
                            Text("$\(product.price, specifier: "%.2f")")
                                .foregroundColor(.green)
                        }
                    }
                }

            }
            .padding()
            .navigationTitle("Products")
        }
    }
}

#Preview {
    ContentView()
}
