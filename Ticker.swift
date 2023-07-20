//
//  Ticker.swift
//  Coins
//
//  Created by Дмитрий Игнатьев on 20.07.2023.
//

import Foundation

import Foundation
import RealmSwift

class Ticker: Object, Decodable {
    @objc dynamic var base: String = ""
    @objc dynamic var target: String = ""
    @objc dynamic var market: Market? = nil
    @objc dynamic var last: Double = 0.0
}

