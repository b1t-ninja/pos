//
//  QueueTest.swift
//  CasaBetterTests
//

import Foundation
import Collections
import Testing
@testable import CasaBetter

struct QueueTest {
  var queue = Queue()
  
  var applePear = ProductDO(name: "Apple Pear", picture: "", price: 2.0, size: "Small", ingredients: [
    Ingredient(name: "Apple", quantity: 1),
    Ingredient(name: "Pear", quantity: 1)
  ])
  var cherryBanana = ProductDO(name: "Cherry Banana", picture: "", price: 2.0, size: "Small", ingredients: [
    Ingredient(name: "Cherry", quantity: 1),
    Ingredient(name: "Banana", quantity: 1)
  ])
  var pineappleCoconut = ProductDO(name: "Pinapple Coconut", picture: "", price: 2.0, size: "Small", ingredients: [
    Ingredient(name: "Pineapple", quantity: 1),
    Ingredient(name: "Coconut", quantity: 1)
  ])
  var coconutLime = ProductDO(name: "Coconut Lime", picture: "", price: 2.0, size: "Small", ingredients: [
    Ingredient(name: "Coconut", quantity: 1),
    Ingredient(name: "Lime", quantity: 1)
  ])
  var appleMango = ProductDO(name: "Apple Mango", picture: "", price: 2.0, size: "Small", ingredients: [
    Ingredient(name: "Apple", quantity: 1),
    Ingredient(name: "Mango", quantity: 1)
  ])
  var mangoOrange = ProductDO(name: "Mango Orange", picture: "", price: 2.0, size: "Small", ingredients: [
    Ingredient(name: "Mango", quantity: 1),
    Ingredient(name: "Orange", quantity: 1)
  ])

  @Test("Can create queue object")
  func testQueueCreation() async throws {
    #expect(queue != nil, "Queue object should not be null")
  }
  
  @Test("Can add products to productsToBeProcessed")
  func testAddingProducts() async throws {
    let order = [applePear, applePear, cherryBanana, appleMango, mangoOrange, coconutLime, applePear, cherryBanana]
    
    order.forEach {
      queue.enqueue(product: $0)
    }
    
    #expect(queue.productsToBeProcessed.count == order.count, "Items should be added to the queue")
  }
  
  @Test("Can remove products form productsToBeProcessed")
  func testRemovingProducst() async throws {
    let order = [applePear, applePear, cherryBanana, appleMango, mangoOrange, coconutLime, applePear, cherryBanana]
    
    order.forEach {
      queue.enqueue(product: $0)
    }
    
    queue.dequeue(prodcut: applePear)
    #expect(queue.productsToBeProcessed.count == 7, "productsToBeProcessed count should be 7")
  }
  
  @Test("Can count same orders together")
  func testGroupingOrders() async throws {
    let order = [applePear, applePear, cherryBanana, appleMango, mangoOrange, coconutLime, applePear, cherryBanana]
    let expected = [applePear : 3, cherryBanana : 2, appleMango: 1, coconutLime : 1, mangoOrange: 1]
    //               3A, 3P             2C, 2B         1A, 1M        1C, 1L         1M,1O
    
    order.forEach {
      queue.enqueue(product: $0)
    }
    
    for (key, value) in queue.ordersCount {
      #expect(value == expected[key], "Elements in both collections should be the same")
    }
  }
  
  @Test("Can produce ingredientsQueue")
  func testIngredientsQueue() async throws {
    let order = [applePear, applePear, cherryBanana, appleMango, mangoOrange, coconutLime, applePear, cherryBanana]
    //               3A, 3P             2C, 2B         1A, 1M        1C, 1L         1M,1O
    
    let expected: [[Ingredient]] = [
      [Ingredient(name: "Apple", quantity: 3), Ingredient(name: "Pear", quantity: 3)],
      [Ingredient(name: "Cherry", quantity: 2), Ingredient(name: "Banana", quantity: 2)],
      [Ingredient(name: "Apple", quantity: 1), Ingredient(name: "Mango", quantity: 1)],
      [Ingredient(name: "Mango", quantity: 1), Ingredient(name: "Orange", quantity: 1)],
      [Ingredient(name: "Coconut", quantity: 1), Ingredient(name: "Lime", quantity: 1)]
    ]
    
    order.forEach {
      queue.enqueue(product: $0)
    }
    
    #expect(queue.ingredients == expected, "Ingredienst should be the same")
  }
  
  @Test("Can remove single ingredient from ingredinetsQueue")
  func testRemoveIngredient() async throws {
    let order = [applePear, applePear, cherryBanana, appleMango, mangoOrange, coconutLime, applePear, cherryBanana]
    let expected: [[Ingredient]] = [
//      [Ingredient(name: "Apple", quantity: 3), Ingredient(name: "Pear", quantity: 3)],
      [Ingredient(name: "Cherry", quantity: 2), Ingredient(name: "Banana", quantity: 2)],
      [Ingredient(name: "Apple", quantity: 1), Ingredient(name: "Mango", quantity: 1)],
      [Ingredient(name: "Mango", quantity: 1), Ingredient(name: "Orange", quantity: 1)],
      [Ingredient(name: "Coconut", quantity: 1), Ingredient(name: "Lime", quantity: 1)]
    ]
    
    order.forEach {
      queue.enqueue(product: $0)
    }
    
    queue.removeIngredientFromQueue()
    queue.removeIngredientFromQueue()
    #expect(queue.ingredients == expected)
  }
  
  @Test("Can add items to products to be processed and queue is correct")
  func testAddItemsToProductsToBeProcessed() async throws {
    let order = [applePear, applePear, cherryBanana, appleMango, mangoOrange, coconutLime, applePear, cherryBanana]
    let expected: [[Ingredient]] = [
      [Ingredient(name: "Apple", quantity: 3), Ingredient(name: "Pear", quantity: 3)],
      [Ingredient(name: "Cherry", quantity: 2), Ingredient(name: "Banana", quantity: 2)],
      [Ingredient(name: "Apple", quantity: 1), Ingredient(name: "Mango", quantity: 1)],
      [Ingredient(name: "Mango", quantity: 1), Ingredient(name: "Orange", quantity: 1)],
      [Ingredient(name: "Coconut", quantity: 2), Ingredient(name: "Lime", quantity: 2)]
    ]
    
    order.forEach {
      queue.enqueue(product: $0)
    }
    
    queue.productsToBeProcessed.append(contentsOf: [coconutLime])
    queue.generateOrdersCount()
    queue.generateIngredientsQueue()
    
    #expect(queue.ingredients == expected)
  }
}
