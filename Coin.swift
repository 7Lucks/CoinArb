//
//  Coin.swift
//  Coins
//
//  Created by Дмитрий Игнатьев on 20.07.2023.
//

import Foundation
import RealmSwift

class Coin: Object, Decodable {
    @objc dynamic var id: String = ""
    @objc dynamic var symbol: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var image: Image? = nil
    @objc dynamic var marketData: MarketData? = nil
    
    enum CodingKeys: String, CodingKey {
        case id
        case symbol
        case name
        case image
        case marketData = "market_data"
    }
    override static func primaryKey() -> String? {
        return "id"
    }
}

