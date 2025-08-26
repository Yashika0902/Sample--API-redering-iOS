struct Products: Codable, Identifiable {
    var id: Int { product_id }   
    
    let product_id: Int 
    let name: String
    let description: String
    var price: Double
    var image: String
    var rating: Double
    var reviews: Reviews
}

struct Reviews: Codable {
    var rating: Double
    var comment: String
}
