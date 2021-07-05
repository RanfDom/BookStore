//
//  BookStoreApi.swift
//  KavaKBookStore
//
//  Created by Ranferi Dominguez Rios on 04/07/21.
//

import Foundation

enum NetworkEnvironment {
    case qa
    case production
    case staging
}

public enum BookStoreAPI {
    case books
    case best_sellers
}

extension BookStoreAPI: Routable {
  
    var environmentBaseURL : String {
        switch NetworkManager.environment {
        case .production: return "https://raw.githubusercontent.com/ejgteja/files/main/"
        case .qa: return "https://raw.githubusercontent.com/ejgteja/files/main/"
        case .staging: return "https://raw.githubusercontent.com/ejgteja/files/main/"
        }
    }
  
  var baseURL: URL {
    guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
    return url
  }
  
  var path: String {
    switch self {
    case .books:
      return "books.json"
    case .best_sellers:
        return "best_sellers.json"
    }
  }
  
  var httpMethod: HTTPMethod {
    return .get
  }
  
  var task: HTTPTask {
    switch self {
    case .books, .best_sellers:
      return .request
    }
  }
  
  var headers: HTTPHeaders? {
    return nil
  }
}
