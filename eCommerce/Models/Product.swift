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
    let title, description, image: String
    let category: String
    let rating: Rating
}
struct Rating: Codable, Hashable{
    let rate: Double
    let count: Int
}
