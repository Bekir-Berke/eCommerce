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
                    Text("\(product.price.formatted(.currency(code: "TRY")))")
                        .font(.subheadline)
                }
            }.padding(.horizontal)
        }
        .frame(width: 150, height: 150)
        .background(.gray.opacity(0.09))
        .border(.black.opacity(0.01))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}

#Preview {
    let product = Product(id: 1, price: 100.99, title: "Macbook Pro", description: "M3 14' Macbook Pro ", image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg", category: "Electronics", rating: Rating(rate: 9.1, count: 100))
    return ProductListRowView(product: product)
}
