//
//  IngredientCardView.swift
//  CasaBetter
//

import SwiftUI

struct IngredientCardView: View {
  @State private var oo: IngredientCardOO = IngredientCardOO()
  @State private var widthSmallRectangle = 5
  @State private var changeDotColor = false
  @Environment(ShoppingBasketOO.self) private var shoppingBasketOO
  var ingredient: Ingredient = Ingredient(name: "Banana", quantity: 3)
  var dotColor: Color = .casaSalmon
  var body: some View {
    ZStack(alignment: .leading) {
      Color.casaDarkGrey
      RoundedRectangle(cornerRadius: 15)
        .frame(width: CGFloat(widthSmallRectangle), height: 200)
        .foregroundStyle(.casaGreen)
      VStack(alignment: .leading, spacing: 20) {
        HStack {
          Text(ingredient.name)
            .font(.custom("CabinetGrotesk-Bold", size: 25))
            .foregroundStyle(oo.fgTitleColor)
          Spacer()
        }
        Text("\(ingredient.quantity)")
          .font(.custom("Satoshi", size: 20).weight(.medium))
          .foregroundStyle(oo.fgQunaitityColor)
        HStack(alignment: .bottom, spacing: 15) {
          Circle()
            .frame(width: 40)
            .foregroundStyle(changeDotColor ? .casaBlack : dotColor)
          Spacer()
          ProductCardButton(icon: "checkmark", onClick: {
            withAnimation {
              widthSmallRectangle = 250
              oo.flipColors()
              changeDotColor.toggle()
            }
            Task {
              try? await Task.sleep(nanoseconds: 500_000_000)
              shoppingBasketOO.queue.removeIngredientFromQueue()
              oo.flipBack()
              widthSmallRectangle = 5
              changeDotColor.toggle()
            }
          }, fgColor: oo.fgButtonColor, bgColor: oo.bgButtonColor)
        }
      }
      .padding()
    }
    .frame(width: 250, height: 200)
    .clipShape(RoundedRectangle(cornerRadius: 15))
  }
}

#Preview {
  IngredientCardView()
    .environment(ShoppingBasketOO())
}
