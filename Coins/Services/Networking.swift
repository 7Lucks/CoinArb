//
//  Networking.swift
//  Coins
//
//  Created by Дмитрий Игнатьев on 15.07.2023.
//

import Foundation
import Moya

enum CoinGeckoAPI {
    case coinsList
    case coinDetail(id: String)
    case coinMarketChart(id: String, from: TimeInterval, to: TimeInterval)
}

extension CoinGeckoAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.coingecko.com/api/v3")!
    }
    
    var path: String {
        switch self {
        case .coinsList:
            return "/coins/list"
        case .coinDetail(let id):
            return "/coins/\(id)"
        case .coinMarketChart(let id, _, _):
            return "/coins/\(id)/market_chart/range"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .coinMarketChart(_, let from, let to):
            return .requestParameters(parameters: ["vs_currency": "usd", "from": from, "to": to], encoding: URLEncoding.queryString)
        default:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}

class CoinGeckoService {
    let provider = MoyaProvider<CoinGeckoAPI>()
    
    func fetchCoins(completion: @escaping (Result<AllListOfAllCoins, Error>) -> Void) {
        provider.request(.coinsList) { result in
            switch result {
            case .success(let response):
                do {
                    let coins = try JSONDecoder().decode(AllListOfAllCoins.self, from: response.data)
                    completion(.success(coins))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchCoinDetail(id: String, completion: @escaping (Result<CoinsDetail, Error>) -> Void) {
        provider.request(.coinDetail(id: id)) { result in
            switch result {
            case .success(let response):
                do {
                    let coinDetail = try JSONDecoder().decode(CoinsDetail.self, from: response.data)
                    completion(.success(coinDetail))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchCoinMarketChart(id: String, from: TimeInterval, to: TimeInterval, completion: @escaping (Result<MarketChart, Error>) -> Void) {
        provider.request(.coinMarketChart(id: id, from: from, to: to)) { result in
            switch result {
            case .success(let response):
                do {
                    let marketChart = try JSONDecoder().decode(MarketChart.self, from: response.data)
                    completion(.success(marketChart))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
