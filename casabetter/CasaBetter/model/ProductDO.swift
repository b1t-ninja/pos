//
//  ProductDO.swift
//  CasaBetter
//

import Foundation

struct ProductDO: Codable, Hashable, Equatable {
  var name: String
  var picture: String
  var price: Double
  var size: String
  var ingredients: [Ingredient]
}

struct Ingredient: Codable, Hashable, Equatable {
  var name: String
  var quantity: Int
}
