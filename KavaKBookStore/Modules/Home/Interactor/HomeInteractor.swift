//
//  HomeInteractor.swift
//  KavaKBookStore
//
//  Created by Ranferi Dominguez Rios on 04/07/21.
//

import Foundation

class HomeInteractor: HomeInteractorInputProtocol {
    weak var presenter: HomeInteractorOutputProtocol?
    
    func fetchBooks() {
        
        let group = DispatchGroup()
        
        var books: [BookModel] = []
        var bestSellers: BestSellersModel?
        
        group.enter()
        NetworkManager().requestBookStore { result in
            switch result {
            case .success(let bookStoreInfo):
                books = bookStoreInfo.books.map{BookModel($0)}
                group.leave()
            case .error(let error):
              self.presenter?.onError(error)
            }
        }
        
        group.enter()
        NetworkManager().requestBestSellers { result in
            switch result {
            case .success(let bestSellersInfo):
                bestSellers = BestSellersModel(bestSellersInfo)
                group.leave()
            case .error(let error):
              self.presenter?.onError(error)
            }
        }
        
        group.notify(queue: DispatchQueue.main) {
            guard let bestSellers = bestSellers else { return }
            self.presenter?.booksDidLoadWith(books, bestSellers: bestSellers)
        }
    }
    
}
