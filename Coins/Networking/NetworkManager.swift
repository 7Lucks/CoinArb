//
//  NetworkManager.swift
//  Coins
//
//  Created by Дмитрий Игнатьев on 20.07.2023.
//

import Foundation
import Moya

class NetworkManager {
    static let provider = MoyaProvider<CoinGeckoAPI>()
    static let queue = OperationQueue()
    
    init() {
        NetworkManager.queue.maxConcurrentOperationCount = 10
    }
    
    static func getCoins(completion: @escaping ([Coin]?) -> ()) {
        queue.addOperation {
            provider.request(.coinList) { result in
                switch result {
                case .success(let response):
                    let coins = try? response.map([Coin].self)
                    print("Data received from server 1: \(coins)")
                    completion(coins)
                case .failure(let error):
                    print("Error: \(error)")
                    completion(nil)
                }
            }
        }
    }
    
    static func getCoinDetail(id: String, completion: @escaping (CoinDetail?) -> ()) {
        queue.addOperation {
            provider.request(.coin(id: id)) { result in
                switch result {
                case .success(let response):
                    let coinDetail = try? response.map(CoinDetail.self)
                    print("Data received from server 2: \(coinDetail)")
                    completion(coinDetail)
                case .failure(let error):
                    print("Error: \(error)")
                    completion(nil)
                }
            }
        }
    }
    
    static func getCoinTickers(id: String, completion: @escaping ([Ticker]?) -> ()) {
        queue.addOperation {
            provider.request(.coinTickers(id: id)) { result in
                switch result {
                case .success(let response):
                    let tickers = try? response.map([Ticker].self)
                    print("Data received from server 3: \(tickers)")
                    completion(tickers)
                case .failure(let error):
                    print("Error: \(error)")
                    completion(nil)
                }
            }
        }
    }
    
//    static func getAllData(completion: @escaping ([Coin]?, CoinDetail?, [Ticker]?) -> ()) {
//        getCoins { coins in
//            guard let coin = coins?.first else {
//                completion(coins, nil, nil)
//                return
//            }
//            getCoinDetail(id: coin.id) { coinDetail in
//                getCoinTickers(id: coin.id) { tickers in
//                    completion(coins, coinDetail, tickers)
//                }
//            }
//        }
//    }
}
