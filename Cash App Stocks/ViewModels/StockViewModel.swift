//
//  StockViewModel.swift
//  Cash App Stocks
//
//  Created by HECTOR TERRERO on 4/26/23.
//

import Foundation

struct StockViewModel {
    let stock: Stock
    
    
    /// computed variable to convert price into dollar.cent format
    var price: String {
        let formatter = NumberFormatter()
        let priceInDollars = Utility.convertCentsToDollarAmount(cents: stock.currentPriceCents)
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        let numberString = formatter.string(from: NSNumber(value: priceInDollars)) ?? "-"
        return numberString
    }
    
    
    /// computed variable to return a human readibale date for the stock timestamp
    var timeStamp: String {
        return Utility.convertDateToReadable(date: Double(stock.currentPriceTimestamp))
    }
    
    
    /// string version of the qty
    var quantity: String {
        return String(stock.quantity ?? 0)
    }
}
