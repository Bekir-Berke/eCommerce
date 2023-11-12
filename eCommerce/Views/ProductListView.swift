//
//  ProductListView.swift
//  eCommerce
//
//  Created by Bekir Berke Yılmaz on 12.11.2023.
//

import SwiftUI

struct ProductListView: View {
    @StateObject private var productViewModel = ProductViewModel()
    private var columns: [GridItem] = [
        GridItem(.flexible(minimum: 150)),
        GridItem(.flexible(minimum: 150))
    ]
    var body: some View {
        NavigationStack{
            ScrollView(.vertical){
                LazyVGrid(columns: columns, spacing: 20){
                    ForEach(productViewModel.filteredProducts, id: \.id){product in
                        ProductListRowView(product: product)
                    }
                }
            }
            .onAppear{
                productViewModel.fetchProducts()
            }
            .searchable(text: $productViewModel.searchText)
            .navigationBarTitleDisplayMode(.automatic)
            .navigationTitle("Götür")
            .overlay{
                if productViewModel.filteredProducts.isEmpty{
                    ContentUnavailableView.search(text: productViewModel.searchText)
                }
            }
        }
    }
}

#Preview {
    ProductListView()
}
