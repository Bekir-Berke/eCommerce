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
        .background(.white)
        .border(.black.opacity(0.01))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: .gray, radius: 8)
    }
}

#Preview {
    ProductListRowView(product: Product.sampleData)
}
