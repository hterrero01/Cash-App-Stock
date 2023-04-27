//
//  Constants.swift
//  Cash App Stocks
//
//  Created by HECTOR TERRERO on 4/19/23.
//

import Foundation

/// Contants all constants for app
struct Constants {
    private init() { }
    
    
    /// endpoint string constant for the portfolio service request.
    static let endPointPortfolio = "https://storage.googleapis.com/cash-homework/cash-stocks-api/portfolio.json"
    
    static let endPointMalformed = "https://storage.googleapis.com/cash-homework/cash-stocks-api/portfolio_malformed.json"
    
    static let endPointEmpty = "https://storage.googleapis.com/cash-homework/cash-stocks-api/portfolio_empty.json"
}
