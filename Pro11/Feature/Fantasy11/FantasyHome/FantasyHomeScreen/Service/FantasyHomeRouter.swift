//
//  FantasyHomeRouter.swift
//  Pro11
//
//  Created by Ravi Ranjan on 25/12/24.
//

import Foundation


class FantasyHomeRouter: BaseRoute {
    enum Endpoint {
        case upcomingMatches(String)

        // Generate the path dynamically based on the endpoint
        var path: String {
            switch self {
            case .upcomingMatches(let limit):
                return NetworkConstant.buildURL(for: .cricket, endpointPath: NetworkConstant.Endpoints.Cricket.upcomingMatches(limit).path)
            }
        }

        // Set HTTP methods for different endpoints if required
        var method: HTTPMethod {
            switch self {
            case .upcomingMatches:
                return .get
            }
        }
    }

    let endpoint: Endpoint
    

    override var path: String {
        endpoint.path
    }

    override var method: HTTPMethod {
        .get
    }

    init(endpoint: Endpoint, headers: [String: String]? = nil, body: Codable? = nil, method: HTTPMethod = .get) {
        self.endpoint = endpoint
        super.init(headers: headers, body: body)
    }
}
