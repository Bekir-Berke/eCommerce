//
//  ProductDetailView.swift
//  eCommerce
//
//  Created by Bekir Berke Yılmaz on 15.11.2023.
//

import SwiftUI
struct ProductDetailView: View {
    @State var product: Product
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
                Text(product.productDescription).font(.caption2).bold().multilineTextAlignment(.center)
            }
            HStack{
                Button(action: {
                    product.cartCount += 1
                }, label: {
                    Image(systemName: "plus.circle.fill")
                })
                Text("\(product.cartCount)")
                Button(action: {
                    product.cartCount -= 1
                }, label: {
                    Image(systemName: "minus.circle.fill")
                }).disabled(product.cartCount == 1 ? true : false)
            }
            HStack{
                Text("\(product.totalPrice.formatted(.currency(code: "TRY")))")
                Button(action: {
                    print(product)
                }, label: {
                    Text("Sepete Ekle")
                }).buttonStyle(.borderedProminent)
            }
        }.frame(maxWidth: 300, maxHeight: 300)
            .onAppear{            }
    }
}

#Preview {
    return ProductDetailView(product: Product.sampleData)
}
