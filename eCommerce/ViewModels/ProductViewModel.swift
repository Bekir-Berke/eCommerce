//
//  ProductViewModel.swift
//  eCommerce
//
//  Created by Bekir Berke Yılmaz on 12.11.2023.
//

import Foundation
import Alamofire
class ProductViewModel: ObservableObject{
    @Published var products: [Product] = []
    @Published var searchText: String = ""
    func fetchProducts(){
        AF.request("https://fakestoreapi.com/products").responseDecodable(of:[Product].self){response in
            switch response.result{
            case.success(let products):
                self.products = products
            case.failure(let error):
                print(error)
            }
        }
    }
    var filteredProducts: [Product]{
        guard !searchText.isEmpty else {return self.products}
        return products.filter{product in
            product.title.lowercased().contains(searchText.lowercased())
        }
    }
}
