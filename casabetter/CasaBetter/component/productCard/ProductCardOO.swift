//
//  ProductCardOO.swift
//  CasaBetter
//
import Foundation
import SwiftUI


@Observable
class ProductCardOO {
  var quantity: Int = 0
  var bgColorButton: Color = .casaDarkGrey
  var fgColorButtonIcon: Color = .casaLightGrey
  var fgColorButtonBorder: Color = .casaLightGrey
  var fgColorCardTitle: Color = .casaWhite
  var fgColorCardPrice: Color = .casaLightGrey
  var quantityColor: Color = .casaWhite
  
  func addToQuantity() {
    quantity += 1
    quantityColor = .casaBlack
    bgColorButton = .casaPurple
    fgColorButtonIcon = .casaBlack
    fgColorButtonBorder = .casaBlack
    fgColorCardTitle = .casaBlack
    fgColorCardPrice = .casaBlack
  }
  
  func subtractFromQuantity() {
    if quantity >= 1 {
      quantity -= 1
      if quantity == 0 {
        bgColorButton = .casaDarkGrey
        fgColorButtonIcon = .casaLightGrey
        fgColorButtonBorder = .casaLightGrey
        fgColorCardTitle = .casaWhite
        fgColorCardPrice = .casaLightGrey
        quantityColor = .white
      }
    }
  }
  
  func reset() {
    bgColorButton = .casaDarkGrey
    fgColorButtonIcon = .casaLightGrey
    fgColorButtonBorder = .casaLightGrey
    fgColorCardTitle = .casaWhite
    fgColorCardPrice = .casaLightGrey
    quantityColor = .white
    quantity = 0
  }
}
