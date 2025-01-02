//
//  ProductCard.swift
//  CasaBetter
//

import SwiftUI


struct ProductCard: View {
  var product: ProductDO = ShoppingBasketOO.mockProduct
  @State private var productCardOO = ProductCardOO()
  @State private var widthSlidingRectangle = 5
  @Environment(ShoppingBasketOO.self) private var shoppingBasketOO
  
  var body: some View {
    ZStack(alignment: .leading) {
      Color.casaDarkGrey
      RoundedRectangle(cornerRadius: 15)
        .frame(width: CGFloat(widthSlidingRectangle), height: 200)
        .foregroundStyle(.casaPurple)
      VStack(alignment: .leading, spacing: 10) {
        HStack {
          Text(product.name).font(.custom("CabinetGrotesk-Bold", size: 25))
            .foregroundStyle(productCardOO.fgColorCardTitle)
          Spacer()
        }
        Text("\(product.price.formatted(.currency(code: "EUR")))").font(.custom("Satoshi", size: 18))
          .foregroundStyle(productCardOO.fgColorCardPrice)
        Spacer()
        HStack(spacing: 15) {
          Spacer()
          ProductCardButton(icon: "minus", onClick: {
            productCardOO.subtractFromQuantity()
            shoppingBasketOO.removeItem(item: product)
            if productCardOO.quantity == 0 {
              withAnimation {
                widthSlidingRectangle = 5
              }
            }
          }, fgColor: productCardOO.fgColorButtonIcon, bgColor: productCardOO.bgColorButton)
          Text("\(productCardOO.quantity)")
            .foregroundStyle(productCardOO.quantityColor)
            .monospaced()
            .font(.system(size: 20))
          ProductCardButton(onClick: {
            productCardOO.addToQuantity()
            shoppingBasketOO.addItem(item: product)
            withAnimation {
              widthSlidingRectangle = 250
            }
          }, fgColor: productCardOO.fgColorButtonIcon, bgColor: productCardOO.bgColorButton)
        }
      }
      .padding()
    }
    .frame(width: 250, height: 200)
    .clipShape(RoundedRectangle(cornerRadius: 15))
  }
}

#Preview {
  ProductCard()
    .environment(ShoppingBasketOO())
}
