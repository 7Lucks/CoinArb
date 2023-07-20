//
//  Market.swift
//  Coins
//
//  Created by Дмитрий Игнатьев on 20.07.2023.
//

import Foundation
import RealmSwift

class Market: Object, Decodable {
    @objc dynamic var name: String = ""
}


