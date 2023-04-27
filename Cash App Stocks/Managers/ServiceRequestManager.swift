//
//  ServiceRequestManager.swift
//  Cash App Stocks
//
//  Created by HECTOR TERRERO on 4/19/23.
//

import Foundation

enum CustomError: Error {
    case generic(message: String)
}

class ServiceRequestManager {
    
    /// shared instance for accessing the Service manager
    static var shared = ServiceRequestManager()
    
    private init () {}
    
    /// Given the service, this enum returns the URL for the endpoint. this is supposed to simulated several services
    enum Services: String {
        
        case getPortfolio
        case empty
        case malformed
        
        var endPoint: URL? {
            switch self {
                
            case .getPortfolio:
                return URL(string: Constants.endPointPortfolio)
            case .empty:
                return URL(string: Constants.endPointEmpty)
            case .malformed:
                return URL(string: Constants.endPointMalformed)
            }
        }
    }
    
    
    /// function hits the API endpoint and returns portfolio stock if successful
    /// - Parameter completion: if != nil successful at fetching and passing[Stocks]
    func fetchPortfolio(service: Services, completion: @escaping(StocksResponse?, Error?)->Void) {
        let serviceType = service
        
        guard let url = serviceType.endPoint else {
            fatalError("unable to cast endpoint")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil, error)
                return
            }
            guard let result = Utility.jsonDecoderHelper(data: data) else {
                completion(nil, CustomError.generic(message: "fail to decode data"))
                return
            }
            completion(result, nil)
    
        }.resume()
    }
}
