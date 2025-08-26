import SwiftUI

struct ProductDetailView: View {
    let product: Products
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                AsyncImage(url: URL(string: product.image)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                    case .failure:
                        Image(systemName: "photo")
                    @unknown default:
                        EmptyView()
                    }
                }

                
                Text(product.name)
                    .font(.title)
                    .bold()
                
                Text(product.description)
                    .font(.body)
                
                Text("Price: $\(product.price, specifier: "%.2f")")
                    .font(.headline)
                    .foregroundColor(.green)
                
              
                Text("⭐️ Rating: \(product.rating, specifier: "%.1f")")
                
                
        
            }
            .padding()
        }
        .navigationTitle(product.name)
    }
}

