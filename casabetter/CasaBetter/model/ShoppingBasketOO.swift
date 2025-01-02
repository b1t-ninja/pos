//
//  ShoppingBasketOO.swift
//  CasaBetter
//

import Foundation
import Collections

@Observable
class ShoppingBasketOO {
  var items: [ProductDO] = []
  var tax = 0.19
  var queue = Queue()
  static var mockProduct = ProductDO(name: "Cherry Banana",
                                     picture: "https://images.pexels.com/photos/1346347/pexels-photo-1346347.jpeg?auto=compress&cs=tinysrgb&w=1200",
                                     price: 3.0,
                                     size: "Small",
                                     ingredients: [
                                      Ingredient(name: "Cherry", quantity: 20),
                                      Ingredient(name: "Banana", quantity: 3),
                                     ])
  var totalWhitoutTax: Double {
    return items.reduce(into: Double()) {acc, curr in
      acc += curr.price
    }
  }
  var taxAmount: Double {
    return totalWhitoutTax * tax
  }
  var totalWithTax: Double {
    return totalWhitoutTax + taxAmount
  }
  var itemBasketList: OrderedDictionary<ProductDO, Int> {
    return items.reduce(into: OrderedDictionary<ProductDO, Int>()) {acc, curr in
      acc[curr, default: 0] += 1
    }
  }
  var itemBasket: Array<(ProductDO, Int)> {
    return itemBasketList.reduce(into: Array<(ProductDO, Int)>()) {acc, curr in
      acc.append((curr.key, curr.value))
    }
  }
  
  func addItem(item: ProductDO) {
    items.append(item)
  }
  
  func removeItem(item: ProductDO) {
    if let index = items.firstIndex(of: item) {
      items.remove(at: index)
    }
  }
  
  func clearItems() {
    items = []
  }
  
  func appendItemsToQueue() {
    queue.productsToBeProcessed.append(contentsOf: items)
    queue.generateOrdersCount()
    queue.generateIngredientsQueue()
  }
}

enum NotionError: Error {
  case invalidURL
  case invalidResponse
  case invalidData
}
