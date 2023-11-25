//
//  ProductViewModel.swift
//  eCommerce
//
//  Created by Bekir Berke Yılmaz on 12.11.2023.
//

import Foundation
import Observation
@Observable 
public class ProductViewModel{
    var products: [Product] = []
    var searchText: String = ""
    func fetchProducts(){
        NetworkManager.shared.getProducts{ result in
                switch result{
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
