//
//  CurrentPrice.swift
//  Coins
//
//  Created by Дмитрий Игнатьев on 20.07.2023.
//

import Foundation
import RealmSwift

class CurrentPrice: Object, Decodable {
    @objc dynamic var usd: Double = 0.0
}

