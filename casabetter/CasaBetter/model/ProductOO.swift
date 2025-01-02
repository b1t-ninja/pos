//
//  ProductOO.swift
//  CasaBetter
//

import Foundation

@Observable
class ProductOO {
  var dataDB: [ProductDO] = []
  
  func fetch() async throws {
    let endpoint = "http://localhost:8080/notionDB"
    guard let url = URL(string: endpoint) else { throw NotionError.invalidURL }
    let (data, response) = try await URLSession.shared.data(from: url)
    
    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
      throw NotionError.invalidResponse
    }
    
    do {
      let decoder = JSONDecoder()
      dataDB = try decoder.decode([ProductDO].self, from: data)
    } catch {
      throw NotionError.invalidData
    }
  }
  
  func triggerCacheRefresh() async throws {
    let endpoint = "http://localhost:8080/refreshCache"
    guard let url = URL(string: endpoint) else { throw NotionError.invalidURL }
    let (_, response) = try await URLSession.shared.data(from: url)
    
    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
      throw NotionError.invalidResponse
    }
  }
}
