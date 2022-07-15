//
//  Models.swift
//  Coinradars
//
//  Created by Olijujuan Green on 2022/04/17.
//

import Foundation

struct Article {
    let imageURl: String
    let url: String
    let sourceName: String
    let title: String
}


struct Coin {
    let price: String
    let changePctHour: String?
    let symbol: String
    let name: String
    let marketCap: String?
    let imageUrl: String
}
