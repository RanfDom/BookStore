//
//  BestSellersModel.swift
//  KavaKBookStore
//
//  Created by Ranferi Dominguez Rios on 04/07/21.
//

import Foundation

// MARK: - BookStore Decodable

struct BestSellers {
    let isbns: [String]
}

extension BestSellers: Decodable {
    private enum BestSellersApiResponseCodingKeys: String, CodingKey {
        case results = "results"
        case isbns = "best_sellers"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: BestSellersApiResponseCodingKeys.self)
        let results = try container.nestedContainer(keyedBy: BestSellersApiResponseCodingKeys.self, forKey: .results)
        isbns = try results.decode([String].self, forKey: .isbns)
    }
}
