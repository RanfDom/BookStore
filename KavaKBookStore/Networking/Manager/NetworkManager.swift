//
//  NetworkManager.swift
//  Brastlewark
//
//  Created by Ranferi Dominguez Rios on 04/07/21.
//

import Foundation

enum NetworkResponse:String {
    case success
    case authenticationError = "You need to be authenticated first."
    case badRequest = "Bad request"
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
}

enum Result<String>{
    case success
    case failure(String)
}

struct NetworkManager {
    static let environment : NetworkEnvironment = .production
    let router = Router<BookStoreAPI>()
    
    func requestBookStore(completion:@escaping (BookStoreServiceResult) -> ()) {
        router.request(.books) { (data, response, error) in
            if error != nil {
                completion(.error("Please check your network connection."))
            } else if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(.error("No data"))
                        return
                    }
                    do {
                        let bookStoreInfo = try JSONDecoder().decode(BookStore.self, from: responseData)
                        completion(.success(bookStoreInfo))
                    }catch {
                        completion(.error("Parser error"))
                    }
                case .failure(let error):
                    completion(.error(error))
                }
            }
        }
    }
    
    func requestBestSellers(completion:@escaping (BestSellerServiceResoult) -> ()) {
        
        router.request(.best_sellers) { (data, response, error) in
            if error != nil {
                completion(.error("Please check your network connection."))
            } else if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(.error("No data"))
                        return
                    }
                    do {
                        let bestSellersInfo = try JSONDecoder().decode(BestSellers.self, from: responseData)
                        completion(.success(bestSellersInfo))
                    }catch {
                        completion(.error("Parser error"))
                    }
                case .failure(let error):
                    completion(.error(error))
                }
            }
        }
    }
  
  fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String>{
    switch response.statusCode {
    case 200...299: return .success
    case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
    case 501...599: return .failure(NetworkResponse.badRequest.rawValue)case 600: return .failure(NetworkResponse.outdated.rawValue)
    default: return .failure(NetworkResponse.failed.rawValue)
    }
  }
    
}
