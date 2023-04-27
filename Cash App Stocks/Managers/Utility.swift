//
//  Utility.swift
//  Cash App Stocks
//
//  Created by HECTOR TERRERO on 4/25/23.
//

import Foundation

class Utility {
    
    
    /// helper function to handle json data
    /// - Parameter data: json data receieve from end point
    /// - Returns: the desired swift struct
    static func jsonDecoderHelper(data: Data) -> StocksResponse? {
        
        var json: StocksResponse?
        
        do {
            json = try  JSONDecoder().decode(StocksResponse.self, from: data)
        }
        catch {
            print ("error \(error)")
        }
        
        guard let result = json else {
            return nil
        }
        
        return result
    }
    
    
    /// helper function to handle currency conversion
    /// - Parameter cents: currency in cent from the api response
    /// - Returns: currency in the format of dollar.cent as Double
    static func convertCentsToDollarAmount(cents: Int) -> Double {
        let dollars = cents / 100
        let remainingChange = (cents % 100)
        let centsDecimals = Double(remainingChange) / 100
        return (Double(dollars) + centsDecimals)
    }
    
    
    /// helper function to handle date conversion to human readable
    /// - Parameter date: date from api response
    /// - Returns: human readable String value for the date
    static func convertDateToReadable(date: TimeInterval)-> String {
        let date = Date(timeIntervalSince1970: date)
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.locale = Locale(identifier: Locale.current.identifier)
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        return dateFormatter.string(from: date)
    }
}
