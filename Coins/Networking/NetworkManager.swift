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
    
    static func getCoins(completion: @escaping ([Coin]?) -> ()) {
        provider.request(.coinList) { result in
            switch result {
            case .success(let response):
                let coins = try? response.map([Coin].self)
                completion(coins)
            case .failure(let error):
                print("Error: \(error)")
                completion(nil)
            }
        }
    }
    
    static func getCoinDetail(id: String, completion: @escaping (CoinDetail?) -> ()) {
        provider.request(.coin(id: id)) { result in
            switch result {
            case .success(let response):
                let coinDetail = try? response.map(CoinDetail.self)
                completion(coinDetail)
            case .failure(let error):
                print("Error: \(error)")
                completion(nil)
            }
        }
    }
    
    static func getCoinTickers(id: String, completion: @escaping ([Ticker]?) -> ()) {
        provider.request(.coinTickers(id: id)) { result in
            switch result {
            case .success(let response):
                let tickers = try? response.map([Ticker].self)
                print("Data received from server: \(tickers)")
                completion(tickers)
            case .failure(let error):
                print("Error: \(error)")
                completion(nil)
            }
        }
    }
}
