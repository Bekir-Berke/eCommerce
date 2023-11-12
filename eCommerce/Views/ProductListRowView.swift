//
//  ProductListRowView.swift
//  eCommerce
//
//  Created by Bekir Berke Yılmaz on 12.11.2023.
//

import SwiftUI

struct ProductListRowView: View {
    @State var product: Product
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: product.image)){image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 90, height: 90)
            VStack{
                Text(product.title)
                    .font(.caption)
                HStack{
                    Text("\(product.price.formatted()) €")
                        .font(.subheadline)
                }
            }
        }
        .frame(width: 150, height: 150)
    }
}

#Preview {
    let product = Product(id: 1, price: 100.99, title: "Macbook Pro", description: "M3 14' Macbook Pro ", image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg", category: "Electronics", rating: Rating(rate: 9.1, count: 100))
    return ProductListRowView(product: product)
}
