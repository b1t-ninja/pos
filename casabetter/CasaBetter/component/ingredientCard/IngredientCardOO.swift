//
//  IngredientCardOO.swift
//  CasaBetter
//


import SwiftUI

@Observable
class IngredientCardOO {
  var fgTitleColor: Color = .casaWhite
  var fgQunaitityColor: Color = .casaWhite
  var fgButtonColor: Color = .casaLightGrey
  var fgIndexColor: Color = .casaLightGrey
  var bgButtonColor: Color = .casaDarkGrey
  
  func flipColors() {
    fgTitleColor = .casaBlack
    fgQunaitityColor = .casaBlack
    fgButtonColor = .casaBlack
    fgIndexColor = .casaBlack
    bgButtonColor = .casaGreen
  }
  
  func flipBack() {
    fgTitleColor = .casaWhite
    fgQunaitityColor = .casaWhite
    fgButtonColor = .casaLightGrey
    fgIndexColor = .casaLightGrey
    bgButtonColor = .casaDarkGrey
  }
}
