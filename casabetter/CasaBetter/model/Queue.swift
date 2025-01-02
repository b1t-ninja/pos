//
//  Queue.swift
//  CasaBetter
//

import Foundation
import Collections

@Observable
class Queue {
  var productsToBeProcessed: [ProductDO] = []
  var ordersCount: OrderedDictionary<ProductDO, Int> = [:]
  var ingredients: [[Ingredient]] = []
  
  func enqueue(product: ProductDO) {
    productsToBeProcessed.append(product)
    generateOrdersCount()
    generateIngredientsQueue()
  }
  
  func dequeue(prodcut: ProductDO) {
    if let index = productsToBeProcessed.firstIndex(of: prodcut) {
      productsToBeProcessed.remove(at: index)
    }
    generateOrdersCount()
    generateIngredientsQueue()
  }
  
  func generateOrdersCount() {
    ordersCount = productsToBeProcessed.reduce(into: OrderedDictionary<ProductDO, Int>()) {acc, curr in
      acc[curr, default: 0] += 1
    }
  }
  
  func generateIngredientsQueue() {
    ingredients = ordersCount.reduce(into: [[Ingredient]]()) {acc, curr in
      let ingredientsOfProductMultiplied: [Ingredient] = curr.key.ingredients.map {ingredient in
        Ingredient(name: ingredient.name, quantity: ingredient.quantity * curr.value)
      }
      acc.append(ingredientsOfProductMultiplied)
    }
  }
  
  func removeIngredientFromQueue() {
    if ingredients[0].count == 1 {
      productsToBeProcessed = productsToBeProcessed.filter {$0 != productsToBeProcessed.first}
      generateOrdersCount()
      generateIngredientsQueue()
    } else {
      ingredients[0].remove(at: 0)
    }
  }
}
