//
//  HomeWireframe.swift
//  KavaKBookStore
//
//  Created by Ranferi Dominguez Rios on 04/07/21.
//

import Foundation

class HomeWireFrame: HomeWireFrameProtocol {
  
  class func createHomeViewController() -> HomeViewController {
    return HomeViewController.instantiate()
  }
  
  static func buildHomeModule() -> Any {
    // Generating module components
    let view = createHomeViewController()
    let presenter: HomePresenterProtocol & HomeInteractorOutputProtocol = HomePresenter()
    let interactor: HomeInteractorInputProtocol = HomeInteractor()
    
    // Connecting
    view.presenter = presenter
    presenter.view = view
    presenter.interactor = interactor
    interactor.presenter = presenter
    
    return view
  }
}
