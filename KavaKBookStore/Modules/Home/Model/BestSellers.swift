//
//  BestSellers.swift
//  KavaKBookStore
//
//  Created by Ranferi Dominguez Rios on 04/07/21.
//

import Foundation

struct BestSellersModel {
    let isbns: [String]
}

extension BestSellersModel {
    init(_ model: BestSellers) {
        self.isbns = model.isbns
    }
}
