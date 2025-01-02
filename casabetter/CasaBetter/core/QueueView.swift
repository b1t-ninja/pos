//
//  QueueView.swift
//  CasaBetter
//

import SwiftUI

struct QueueView: View {
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      IngredinetQueueView()
    }
  }
}

#Preview {
  QueueView()
    .environment(ShoppingBasketOO())
}
