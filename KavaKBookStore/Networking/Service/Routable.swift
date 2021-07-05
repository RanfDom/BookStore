//
//  Routable.swift
//  KavaKBookStore
//
//  Created by Ranferi Dominguez Rios on 04/07/21.
//

import Foundation

protocol Routable {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}

enum BookStoreServiceResult {
    case success(BookStore)
    case error(String)
}
enum BestSellerServiceResoult {
    case success(BestSellers)
    case error(String)
}

enum BookError: Error {
    case fileNotFound
    case invalidURL
}
