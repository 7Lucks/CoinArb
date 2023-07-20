//
//  Image.swift
//  Coins
//
//  Created by Дмитрий Игнатьев on 20.07.2023.
//

import Foundation

import Foundation
import RealmSwift

class Image: Object, Decodable {
    @objc dynamic var thumb: String = ""
    @objc dynamic var small: String = ""
    @objc dynamic var large: String = ""
}
