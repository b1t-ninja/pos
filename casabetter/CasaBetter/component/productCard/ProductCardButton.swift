//
//  ProductCardButton.swift
//  CasaBetter
//
import SwiftUI

struct ProductCardButton: View {
  var icon: String = "plus"
  var onClick: (() -> Void)? = nil
  var fgColor: Color = .casaWhite
  var bgColor: Color = .casaDarkGrey
  var body: some View {
    Button {
      if let handle = onClick {
        handle()
      } else {
        print("function is null")
      }
    } label: {
      RoundedRectangle(cornerRadius: 10)
        .frame(width: 40, height: 40)
        .foregroundStyle(bgColor)
        .border(fgColor)
        .overlay(
          Image(systemName: icon)
            .foregroundStyle(fgColor)
        )
    }
  }
}
