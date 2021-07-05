//
//  BookModel.swift
//  KavaKBookStore
//
//  Created by Ranferi Dominguez Rios on 04/07/21.
//

import Foundation

// MARK: - BookStore Decodable

struct BookStore {
    let books: [Book]
}

extension BookStore: Decodable {
    private enum BookStoreApiResponseCodingKeys: String, CodingKey {
        case BookStore = "books"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: BookStoreApiResponseCodingKeys.self)
        books = try container.decode([Book].self, forKey: .BookStore)
    }
}

// MARK: - Book Decodable

struct Book {
    let isbn: String
    let title: String
    let author: String
    let description: String
    let genre: String
    let image: String
    let imported: Bool
}

extension Book: Decodable {
  private enum GnomeCodingKeys: String, CodingKey {
    case isbn
    case title
    case author
    case description
    case genre
    case image
    case imported
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: GnomeCodingKeys.self)
    
    isbn = try container.decode(String.self, forKey: .isbn)
    title = try container.decode(String.self, forKey: .title)
    author = try container.decode(String.self, forKey: .author)
    description = try container.decode(String.self, forKey: .description)
    genre = try container.decode(String.self, forKey: .genre)
    image = try container.decode(String.self, forKey: .image)
    imported = try container.decode(Bool.self, forKey: .imported)
  }
}
