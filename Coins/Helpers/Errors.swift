//
//  Errors.swift
//  Coins
//
//  Created by Дмитрий Игнатьев on 20.07.2023.
//

import Foundation

enum NetworkError: Error {
    case decodingError
    case domainError
    case urlError
}

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .decodingError:
            return NSLocalizedString("Decoding Error", comment: "Decoding Error")
        case .domainError:
            return NSLocalizedString("Domain Error", comment: "Domain Error")
        case .urlError:
            return NSLocalizedString("URL Error", comment: "URL Error")
        }
    }
}

