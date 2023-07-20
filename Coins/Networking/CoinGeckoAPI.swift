//
//  CoinGeckoAPI.swift
//  Coins
//
//  Created by Дмитрий Игнатьев on 20.07.2023.
//

import Foundation
import Moya

enum CoinGeckoAPI {
    case coinList
    case coin(id: String)
    case coinTickers(id: String)
}

extension CoinGeckoAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.coingecko.com/api/v3")!
    }
    
    var path: String {
        switch self {
        case .coinList:
            return "/coins/list"
        case let .coin(id):
            return "/coins/\(id)"
        case let .coinTickers(id):
            return "/coins/\(id)/tickers"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return nil
    }
}


