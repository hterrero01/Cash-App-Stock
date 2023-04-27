//
//  StockRowView.swift
//  Cash App Stocks
//
//  Created by HECTOR TERRERO on 4/25/23.
//

import SwiftUI

struct StockRowView: View {
    var stock: StockViewModel
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            VStack (alignment: .leading, spacing: 4) {
                Text(stock.stock.ticker)
                    .font(.headline)
                    .accessibilityLabel("sticker \(stock.stock.ticker)")
                Text(stock.stock.name)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .accessibilityLabel("stock name \(stock.stock.name)")
            }
            .accessibilityElement(children: .combine)
            Spacer(minLength: 4)
            VStack (alignment: .trailing, spacing: 4) {
                HStack(alignment: .top) {
                    Text("qty: \(stock.quantity)")
                        .font(.callout)
                        .accessibilityLabel("Quantity held")
                        .accessibilityValue(stock.quantity)
                    Text("\(stock.stock.currency)\(stock.price)")
                        .lineLimit(1)
                        .font(.subheadline)
                        .accessibilityLabel("Price")
                        .accessibilityValue("\(stock.stock.currency)\(stock.price)")
                }
                Text("\(stock.timeStamp)")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .accessibilityLabel("Updated on: \(stock.timeStamp),")
            }
            .accessibilityElement(children: .combine)
        }
    }
    
}

struct StockRowView_Previews: PreviewProvider {
    static var previews: some View {
        StockRowView(stock: StockViewModel(stock: Stock(ticker: "UA", name: "Under Armour, Inc", currency: "USD", currentPriceCents: 3434444, quantity: 34, currentPriceTimestamp: 159794385)))
    }
}
