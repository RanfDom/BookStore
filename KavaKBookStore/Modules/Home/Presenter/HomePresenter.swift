//
//  HomePresenter.swift
//  KavaKBookStore
//
//  Created by Ranferi Dominguez Rios on 04/07/21.
//

import Foundation

class HomePresenter: HomePresenterProtocol {
  weak var view: HomeViewProtocol?
  var interactor: HomeInteractorInputProtocol?
  
  func fetchHome() {
    interactor?.fetchBooks()
  }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    func booksDidLoadWith(_ books: [BookModel], bestSellers: BestSellersModel) {
        let bestSellers: [BookViewModel] = findBestSellers(bestSellers, in: books)
        var history: [BookViewModel] = []
        var science: [BookViewModel] = []
        var business: [BookViewModel] = []
        
        for book in books {
            switch book.genre {
            case "History":
                history.append(BookViewModel(book))
            case "Science":
                science.append(BookViewModel(book))
            case "Business":
                business.append(BookViewModel(book))
            default:
                print("No genre")
            }
        }
        
        view?.reloadViewWith([
            BookStoreSectionViewModel(sectionTitle: "Best Sellers", books: bestSellers),
            BookStoreSectionViewModel(sectionTitle: "History", books: history),
            BookStoreSectionViewModel(sectionTitle: "Science", books: science),
            BookStoreSectionViewModel(sectionTitle: "Business", books: business)
        ])
    }
    
    func onError(_ error: String) {
        view?.show(error: error)
    }
}

private extension HomePresenter {
    func findBestSellers(_ bestSellers: BestSellersModel, in books:[BookModel]) -> [BookViewModel] {
        var result: [BookViewModel] = []

        for isbn in bestSellers.isbns {
            if let index = books.firstIndex(where: { $0.isbn == isbn }) {
                result.append(BookViewModel(books[index]))
            }
            
        }
        return result
    }
}
