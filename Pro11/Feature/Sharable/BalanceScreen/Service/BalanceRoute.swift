//
//  BalanceRoute.swift
//  Pro11
//
//  Created by Ravi Ranjan on 11/01/25.
//

import Foundation

class BalanceRoute:BaseRoute{
    
    enum Endpoint {
        case getBalance(UserId: String)
        case createOrder(UserId: String)

        // Generate the path dynamically based on the endpoint
        var path: String {
            switch self {
            case .getBalance(let userid):
                return NetworkConstant.buildURL(for: .api, endpointPath: NetworkConstant.Endpoints.API.wallet(userId: userid).path)
            case .createOrder(let userid):
                return NetworkConstant.buildURL(for: .api, endpointPath: NetworkConstant.Endpoints.API.createOrder(userId: userid).path)
            }
        }

        // Set HTTP methods for different endpoints if required
        var method: HTTPMethod {
            switch self {
            case .getBalance:
                return .get
            case .createOrder:
                return .post
            }
        }
    }

    let endpoint: Endpoint
    

    override var path: String {
        endpoint.path
    }

    override var method: HTTPMethod {
        endpoint.method
    }

    init(endpoint: Endpoint, headers: [String: String]? = nil, body: Codable? = nil, method: HTTPMethod = .get) {
        self.endpoint = endpoint
        super.init(headers: headers, body: body)
    }
}
