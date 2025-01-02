//
//  RegisterView.swift
//  CasaBetter
//

import SwiftUI
struct RegisterView: View {
  @State private var shoppingBasketOO = ShoppingBasketOO()
  @State private var productOO = ProductOO()
  var body: some View {
    TabView {
      Tab("Register", systemImage: "filemenu.and.cursorarrow.rtl") {
        HStack(alignment: .top) {
          ScrollView(.vertical, showsIndicators: false) {
            ProductCardGrid()
          }
          .frame(width: 850)
          
          VStack {
            ScrollView(.vertical, showsIndicators: false) {
              OrderSummaryItemList()
            }
            OrderSummary()
          }
        }
      }
      Tab("Queue", systemImage: "line") {
        QueueView()
      }
    }
    .environment(shoppingBasketOO)
    .environment(productOO)
  }
}

#Preview {
  RegisterView()
}
