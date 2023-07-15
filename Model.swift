//
//  Model.swift
//  Coins
//
//  Created by Дмитрий Игнатьев on 15.07.2023.
//

import Foundation

// MARK: - AllListOfAllCoinsElement
struct AllListOfAllCoinsElement: Codable {
    let id, symbol, name: String
}

typealias AllListOfAllCoins = [AllListOfAllCoinsElement]

// MARK: - ListOfAllExchangeID
struct ListOfAllExchangeID: Codable {
    let id, name: String
}

typealias ListOfAllExchangeIDs = [ListOfAllExchangeID]

// MARK: - CoinsDetail
struct CoinsDetail: Codable {
    let id: String
    let name: String
    let image: Image
    let marketData: MarketData
    let tickers: [Ticker]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case image
        case marketData = "market_data"
        case tickers
    }
    
    struct Image: Codable {
        let thumb: URL
        let small: URL
        let large: URL
    }
    
    struct MarketData: Codable {
        let currentPrice: Double
        
        enum CodingKeys: String, CodingKey {
            case currentPrice = "current_price"
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let priceDictionary = try container.decode([String: Double].self, forKey: .currentPrice)
            currentPrice = priceDictionary["usd"] ?? 0.0
        }
    }
    
    struct Ticker: Codable {
        let market: Market
        let last: Double
        
        struct Market: Codable {
            let name: String
        }
    }
}

struct MarketChart: Codable {
    let prices: [[Double]]
    
    var coinPrices: [Double] {
        return prices.map { $0[1] }
    }
}
