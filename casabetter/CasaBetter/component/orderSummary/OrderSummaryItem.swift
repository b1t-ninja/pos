//
//  OrderSummaryItem.swift
//  CasaBetter
//

import SwiftUI

struct OrderSummaryItem: View {
  var product: ProductDO = ShoppingBasketOO.mockProduct
  var quantity: Int = 2
  var price: Double {
    return product.price * Double(quantity)
  }
  var body: some View {
    HStack() {
      Text(product.name)
        .font(.custom("CabinetGrotesk-Bold", size: 20))
      Text("\(product.size.prefix(1))")
        .font(.custom("Satoshi", size: 20))
      Spacer()
      Text("x\(quantity)").foregroundStyle(.casaLightGrey)
        .font(.custom("Satoshi", size: 20))
      Text("\(price.formatted(.currency(code: "EUR")))")
        .font(.custom("Satoshi", size: 20).weight(.medium))
    }
    .padding()
    .frame(width: 300)
    .background(
      RoundedRectangle(cornerRadius: 10)
        .foregroundStyle(.casaDarkGrey)
    )
  }
}

#Preview {
    OrderSummaryItem()
}
