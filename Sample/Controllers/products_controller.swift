/*import Foundation

@MainActor
class ProductsViewModel: ObservableObject {
    @Published var products: [Products] = []
    
    //init
    init() {
        Task.init {
            await fetchProducts()
        }
    }
    
    //api calling function
    
    func fetchProducts() async {
        do {
            
            //url object
            guard let url = URL(string: "https://fake-store-api.mock.beeceptor.com/api/products") else {
                fatalError("error creating url")
            }
            
            //url request
            let urlRequest = URLRequest(url: url)
            
            //get JSON
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            //http response check
            guard (response as?HTTPURLResponse)?.statusCode == 200 else {
                fatalError("error fetching data")
            }
            
            //decode into struct
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedProducts = try decoder.decode([Products].self, from: data)
            
            
            //ui update on main thread
            self.products = decodedProducts
            
        }catch {
            //error
            print(error)
        }
    }
}*/


import Foundation

@MainActor
class ProductsViewModel: ObservableObject {
    @Published var products: [Products] = []   
    
    init() {
        Task {
            await fetchProducts()
        }
    }
    
    func fetchProducts() async {
        do {
            guard let url = URL(string: "https://fake-store-api.mock.beeceptor.com/api/products") else {
                fatalError("error creating url")
            }
            
            let urlRequest = URLRequest(url: url)
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            if let jsonString = String(data: data, encoding: .utf8) {
                print("RAW JSON:", jsonString)
            }
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                fatalError("error fetching data")
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedProducts = try decoder.decode([Products].self, from: data)
            
            self.products = decodedProducts
        } catch {
            print("❌ Error decoding products:", error)
        }
    }
}
