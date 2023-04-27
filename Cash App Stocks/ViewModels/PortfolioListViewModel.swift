//
//  PortfolioListViewModel.swift
//  Cash App Stocks
//
//  Created by HECTOR TERRERO on 4/25/23.
//

import Foundation

class PortfolioListViewModel: ObservableObject {
    var listOfStocks: [Stock] = []
    @Published var filterStockList: [Stock] = []
    @Published var errorMessage = ""
    
    
    /// Cleans the stock list returning from the endpoint to remove stocks with no qty.
    func removedEmptyStocks() {
        self.filterStockList = self.listOfStocks.filter({$0.quantity != nil})
    }
    
    
    /// fetches the stock list from endpoint to populate the viewmodel
    /// - Parameter completion: completion handler to do additional view arrangements
    func fetchStocks(completion: @escaping(Error?)->Void) {
        ServiceRequestManager.shared.fetchPortfolio(service: .getPortfolio) { [weak self] response, error  in
            guard let self = self else { return }
            guard let response = response else {
                if let error = error {
                    DispatchQueue.main.async {
                        self.errorMessage = error.localizedDescription
                    }
                    completion(error)
                    return
                } else {
                    self.errorMessage = "UNKNOWN ERROR"
                    completion(error)
                    return
                }
            }
            DispatchQueue.main.async {
                self.listOfStocks = response.stocks
                self.removedEmptyStocks()
                completion(nil)
            }
        }
    }
    
    
    /// provides the viewmodel with a sorted list of stock based on a filter
    /// - Parameter filter: the filtered for which to sort the stock array
    func filterStockList(filter: FilterOptions) {
        removedEmptyStocks()
        switch filter {
            
        case .price:
            removedEmptyStocks()
            filterStockList = filterStockList.sorted(by: {$0.currentPriceCents < $1.currentPriceCents})
            print(filterStockList)
        case .ticker:
            filterStockList = filterStockList.sorted(by: {$0.ticker < $1.ticker})
            print(filterStockList)
        case .name:
            filterStockList = filterStockList.sorted(by: {$0.name < $1.name})
            print(filterStockList)
        }
    }
}
