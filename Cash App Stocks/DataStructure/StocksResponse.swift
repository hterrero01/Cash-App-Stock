//
//  Portfolio.swift
//  Cash App Stocks
//
//  Created by HECTOR TERRERO on 4/19/23.
//

import Foundation


/// Response Structure
struct StocksResponse: Codable {
    let stocks: [Stock]
}


/// Stock Structure
public struct Stock: Codable, Equatable {
    let ticker: String
    let name: String
    let currency: String
    let currentPriceCents: Int
    let quantity: Int?
    let currentPriceTimestamp: Int
    
    enum CodingKeys: String, CodingKey {
        case ticker
        case name
        case currency
        case currentPriceCents = "current_price_cents"
        case quantity
        case currentPriceTimestamp = "current_price_timestamp"
    }
}
