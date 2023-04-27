//
//  Cash_App_StocksTests.swift
//  Cash App StocksTests
//
//  Created by HECTOR TERRERO on 4/19/23.
//

import XCTest
@testable import Cash_App_Stocks

final class Cash_App_StocksTests: XCTestCase {
    
    let stock = Stock(ticker: "UA", name: "Under Armour, Inc", currency: "USD", currentPriceCents: 844, quantity: nil, currentPriceTimestamp: 1597942385)
    
    let stocks = [Stock(ticker: "PA", name: "Peter Alter", currency: "USD", currentPriceCents: 456, quantity: nil, currentPriceTimestamp: 1597942385), Stock(ticker: "DEL", name: "Delta", currency: "USD", currentPriceCents: 654, quantity: 4, currentPriceTimestamp: 1597942385),Stock(ticker: "BETA", name: "Better Health", currency: "USD", currentPriceCents: 2345, quantity: nil, currentPriceTimestamp: 1597942385)]
    
    func testPriceConversion() {
        let stockModel = StockViewModel(stock: stock)
        let stockPriceinDollars = stockModel.price
        
        XCTAssertEqual(stockPriceinDollars, "$8.44")
    }
    
    func testStockTimeStampString() {
        let stockModel = StockViewModel(stock: stock)
        let date = stockModel.timeStamp
        XCTAssertEqual(date, "Thursday, Aug 20, 2020")
    }
    
    func testZeroQtyStock() {
        let stockModel = StockViewModel(stock: stock)
        let qty = stockModel.quantity
        XCTAssertEqual(qty, "0")
    }
    
    func testEmptyStockRemoval() {
        var model = PortfolioListViewModel()
        model.listOfStocks = stocks
        model.removedEmptyStocks()
        model.listOfStocks.removeFirst()
        model.listOfStocks.removeLast()
        var finalList = model.filterStockList
        XCTAssertEqual(finalList, model.listOfStocks)
    }
    
}
