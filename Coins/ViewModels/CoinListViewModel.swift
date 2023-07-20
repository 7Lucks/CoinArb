//
//  CoinListViewModel.swift
//  Coins
//
//  Created by Дмитрий Игнатьев on 20.07.2023.
//

import Foundation
import RealmSwift

class CoinListViewModel {
    var coins: Results<Coin>?
    var token: NotificationToken?
    let realm = try! Realm()
    
    var count: Int {
        return coins?.count ?? 0
    }
    
    func fetchCoins() {
        NetworkManager.getCoins { [weak self] (coins) in
            guard let coins = coins else { return }
            try? self?.realm.write {
                self?.realm.add(coins, update: .modified)
            }
        }
        coins = realm.objects(Coin.self)
        token = coins?.observe { [weak self] (changes: RealmCollectionChange) in
            switch changes {
            case .initial:
                self?.updateUI()
            case .update(_, let deletions, let insertions, let modifications):
                self?.updateUI(deletions: deletions, insertions: insertions, modifications: modifications)
            case .error(let error):
                fatalError("\(error)")
            }
        }
    }
    
    func coin(at index: Int) -> Coin? {
        return coins?[index]
    }
    
    func updateUI(deletions: [Int] = [], insertions: [Int] = [], modifications: [Int] = []) {
        // Update your UI here
    }
}
