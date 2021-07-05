//
//  HomeViewController.swift
//  KavaKBookStore
//
//  Created by Ranferi Dominguez Rios on 04/07/21.
//

import Foundation
import UIKit

class HomeViewController: UIViewController, LoadableViewController, HomeViewProtocol {
    static var storyboardFileName: String = "HomeViewController"
    var presenter: HomePresenterProtocol?
    @IBOutlet weak var tableView: UITableView!
    
    private var bookStoreViewModel: [BookStoreSectionViewModel] = []
    
    func reloadViewWith(_ bookStoreViewModel: [BookStoreSectionViewModel]) {
        self.bookStoreViewModel = bookStoreViewModel
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        presenter?.fetchHome()
        tableView.dataSource = self
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
        
    func numberOfSections(in tableView: UITableView) -> Int {
        bookStoreViewModel.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        bookStoreViewModel[section].sectionTitle
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        bookStoreViewModel[section].books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BookViewCell.identifier) as? BookViewCell else {
          return UITableViewCell()
        }
        cell.configure(with: bookStoreViewModel[indexPath.section].books[indexPath.row])
        return cell
    }
    
    
}
