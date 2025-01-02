//
//  ProductCardGrid.swift
//  CasaBetter
//

import SwiftUI

struct ProductCardGrid: View {
  @Environment(ShoppingBasketOO.self) private var shoppingBasketOO
  @Environment(ProductOO.self) private var productOO
  var body: some View {
    LazyVGrid(columns: [
      GridItem(.flexible()),
      GridItem(.flexible()),
      GridItem(.flexible())
    ], spacing: 10) {
      ForEach(productOO.dataDB, id: \.self) { product in
        ProductCard(product: product)
      }
    }
    .task {
      do {
        try await productOO.fetch()
      } catch {
        print("Fetch failed with error: \(error)")
      }
    }
  }
}

#Preview {
  ProductCardGrid()
    .environment(ShoppingBasketOO())
    .environment(ProductOO())
}
