//
//  BookModel.swift
//  KavaKBookStore
//
//  Created by Ranferi Dominguez Rios on 04/07/21.
//

import Foundation

// MARK: - Book Model

struct BookModel {
    let isbn: String
    let title: String
    let author: String
    let description: String
    let genre: String
    let image: String
    let imported: Bool
}

extension BookModel {
    init(_ model: Book) {
        self.isbn = model.isbn
        self.title = model.title
        self.author = model.author
        self.description = model.description
        self.genre = model.genre
        self.image = model.image
        self.imported = model.imported
    }
}

// MARK: - Book View Model

struct BookViewModel {
    let isbn: String
    let title: String
    let author: String
    let description: String
    let genre: String
    let image: URL?
    let imported: Bool
}

extension BookViewModel {
    init(_ model: BookModel) {
        self.isbn = model.isbn
        self.title = model.title
        self.author = model.author
        self.description = model.description
        self.genre = model.genre
        self.image = URL(string: model.image)
        self.imported = model.imported
    }
}
