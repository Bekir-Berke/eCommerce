//
//  Product.swift
//  eCommerce
//
//  Created by Bekir Berke Yılmaz on 12.11.2023.
//

import Foundation
struct Product: Codable, Identifiable, Hashable{
    let id: Int
    let price: Double
    let title, image, category: String
    let productDescription: String
    let rating: Rating
    var cartCount = 1
    var totalPrice: Double{
        price * Double(cartCount)
    }
    private enum CodingKeys: String, CodingKey{
        case id, price, title, image, category, rating
        case productDescription = "description"
    }

}
struct Rating: Codable, Hashable{
    let rate: Double
    let count: Int
}
extension Product{
    static let sampleData: Product = Product(id: 1, price: 100.99, title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops", image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg", category: "Electronics", productDescription: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday", rating: Rating(rate: 9.1, count: 50))
}
