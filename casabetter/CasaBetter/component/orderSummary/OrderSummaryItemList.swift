//
//  OrderSummaryItemList.swift
//  CasaBetter
//

import SwiftUI

struct OrderSummaryItemList: View {
  @Environment(ShoppingBasketOO.self) private var oo
  var body: some View {
      VStack {
        ForEach(oo.itemBasket, id: \.0.hashValue) { tuple in
          OrderSummaryItem(product: tuple.0, quantity: tuple.1)
        }
      }
    }
}

#Preview {
    OrderSummaryItemList()
    .environment(ShoppingBasketOO())
}
