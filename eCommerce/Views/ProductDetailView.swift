//
//  ProductDetailView.swift
//  eCommerce
//
//  Created by Bekir Berke Yılmaz on 15.11.2023.
//

import SwiftUI
import SwiftData
struct ProductDetailView: View {
    @Environment(\.modelContext) private var context
    @State var product: Product
    @State var cartCount: Int = 1
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: product.image)){image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }.frame(maxWidth: 200, maxHeight: 200)
            VStack{
                Text(product.title).font(.title2).bold().multilineTextAlignment(.center)
                Text(product.description).font(.caption2).bold().multilineTextAlignment(.center)
            }
            HStack{
                Button(action: {
                    cartCount += 1
                }, label: {
                    Image(systemName: "plus.circle.fill")
                })
                Text("\(cartCount)")
                Button(action: {
                    cartCount -= 1
                }, label: {
                    Image(systemName: "minus.circle.fill")
                }).disabled(cartCount == 1 ? true : false)
            }
            HStack{
                Text("\(product.price.formatted(.currency(code: "TRY")))")
                Button(action: {
                    print(product)
                }, label: {
                    Text("Sepete Ekle")
                }).buttonStyle(.borderedProminent)
            }
        }.frame(maxWidth: 300, maxHeight: 300)
    }
}

#Preview {
    let product = Product(id: 1, price: 100.99, title: "Macbook Pro", description: "M3 14' Macbook Pro ", image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg", category: "Electronics", rating: Rating(rate: 9.1, count: 100))
    return ProductDetailView(product: product)
}
