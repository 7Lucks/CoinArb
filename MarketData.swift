//
//  MarketData.swift
//  Coins
//
//  Created by Дмитрий Игнатьев on 20.07.2023.
//

import Foundation

import Foundation
import RealmSwift

class MarketData: Object, Decodable {
    @objc dynamic var currentPrice: CurrentPrice? = nil

    enum CodingKeys: String, CodingKey {
        case currentPrice = "current_price"
    }
}

