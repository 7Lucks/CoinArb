//
//  CryptoTableViewModel.swift
//  Coins
//
//  Created by Дмитрий Игнатьев on 15.07.2023.
//

import Foundation

class CryptoTableViewModel {
    let coinGeckoService = CoinGeckoService()
    var coins: [CoinsDetail] = []
    var coinIDs: [String] = []
    
    func fetchCoinsAndExchanges(completion: @escaping () -> Void) {
        coinGeckoService.fetchCoins { [weak self] result in
            switch result {
            case .success(let coins):
                self?.coinIDs = coins.map { $0.id }
                self?.fetchCoinDetails(completion: completion)
            case .failure(let error):
                print("Failed to fetch coins: \(error)")
            }
        }
    }
    
    private func fetchCoinDetails(completion: @escaping () -> Void) {
        let group = DispatchGroup()
        for id in coinIDs {
            group.enter()
            coinGeckoService.fetchCoinDetail(id: id) { [weak self] result in
                switch result {
                case .success(let coinDetail):
                    self?.coins.append(coinDetail)
                case .failure(let error):
                    print("Failed to fetch details for coin \(id): \(error)")
                }
                group.leave()
            }
        }
        group.notify(queue: .main) {
            completion()
        }
    }
    
    func numberOfItems() -> Int {
        return coins.count
    }
    
    func item(at index: Int) -> CoinsDetail {
        return coins[index]
    }
}
