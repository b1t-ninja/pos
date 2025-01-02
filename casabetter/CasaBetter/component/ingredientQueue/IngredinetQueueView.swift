//
//  IngredinetQueueView.swift
//  CasaBetter
//

import SwiftUI

struct IngredinetQueueView: View {
  @Environment(ShoppingBasketOO.self) private var shoppingBasketOO
  var columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
  var body: some View {
    LazyVGrid(columns: columns, spacing: 20) {
      ForEach(shoppingBasketOO.queue.ingredients, id: \.self.hashValue) {
        ForEach($0, id: \.hashValue) {ingredient in
          IngredientCardView(ingredient: ingredient)
        }
      }
    }
  }
}

#Preview {
  IngredinetQueueView()
    .environment(ShoppingBasketOO())
}
