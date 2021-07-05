//
//  HomeProtocols.swift
//  KavaKBookStore
//
//  Created by Ranferi Dominguez Rios on 04/07/21.
//

import Foundation

// MARK: - Router Protocols

/**
 * Add here your methods for  WIREFRAME
 */
protocol HomeWireFrameProtocol: AnyObject {
    static func buildHomeModule() -> Any
}

// MARK: - View Protocols

/**
 * Methods for communication PRESENTER -> VIEW
 */
protocol HomeViewProtocol: LoadableViewController, ErrorHandling {
    var presenter: HomePresenterProtocol? { get set }
    
    func reloadViewWith(_ bookStoreViewModel: [BookStoreSectionViewModel])
}

// MARK: - Presenter Protocols

/**
 * Methods for communication VIEW -> PRESENTER
 */
protocol HomePresenterProtocol: AnyObject {
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorInputProtocol? { get set }
    
    func fetchHome()
}

// MARK: - Interactor Protocols

/**
 * Methods for communication PRESENTER -> INTERACTOR
 */
protocol HomeInteractorInputProtocol: AnyObject {
    var presenter: HomeInteractorOutputProtocol? { get set }
    func fetchBooks()
}

/**
 * Methods for communication INTERACTOR -> PRESENTER
 */
protocol HomeInteractorOutputProtocol: AnyObject {
    func booksDidLoadWith(_ books: [BookModel], bestSellers: BestSellersModel)
    func onError(_ error: String)
}
