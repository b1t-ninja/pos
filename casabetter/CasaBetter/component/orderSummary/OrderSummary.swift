//
//  OrderSummary.swift
//  CasaBetter
//

import SwiftUI

struct OrderSummary: View {
  @Environment(ShoppingBasketOO.self) private var shoppingBasketOO
  @Environment(ProductOO.self) private var productOO
  var body: some View {
    VStack() {
      HStack {
        Text("Subtotal")
          .font(.custom("Satoshi-Regular", size: 20))
        Spacer()
        Text("\(shoppingBasketOO.totalWhitoutTax.formatted(.currency(code: "EUR")))")
          .font(.custom("Satoshi-Medium", size: 20))
      }
      HStack {
        Text("Tax 19%")
          .font(.custom("Satoshi-Regular", size: 20))
        Spacer()
        Text("\(shoppingBasketOO.taxAmount.formatted(.currency(code: "EUR")))")
          .font(.custom("Satoshi-Medium", size: 20))
      }
      
      Divider()
        .foregroundStyle(.casaWhite)
      
      HStack {
        Text("Total")
          .font(.custom("Satoshi", size: 25))
        Spacer()
        Text("\(shoppingBasketOO.totalWithTax.formatted(.currency(code: "EUR")))")
          .font(.custom("Satoshi", size: 26).weight(.medium))
        
      }
      Spacer()
      
      Button {
        shoppingBasketOO.appendItemsToQueue()
        shoppingBasketOO.clearItems()
        Task {
          do {
            try await productOO.triggerCacheRefresh()
          } catch {
            print("Cant refrrsh")
          }
        }
      } label: {
        Text("Place Order")
          .font(.custom("Satoshi", size: 23).weight(.regular))
          .foregroundStyle(.casaBlack)
          .padding()
          .background(.casaWhite)
          .clipShape(RoundedRectangle(cornerRadius: 20))
      }
    }
    .padding()
    .frame(width: 300, height: 200)
    .background(.casaDarkGrey)
    .cornerRadius(20)
  }
}

#Preview {
  OrderSummary()
    .environment(ShoppingBasketOO())
    .environment(ProductOO())
}
