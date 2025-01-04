//
//  ContestRoute.swift
//  Pro11
//
//  Created by Ravi Ranjan on 29/12/24.
//

import Foundation
class ContestRoute: BaseRoute {
    
    enum Endpoint {
        case getContestByMatchID(String)

        var path: String {
            switch self {
            case .getContestByMatchID(let matchID):
                return NetworkConstant.buildURL(for: .contests, endpointPath: NetworkConstant.Endpoints.Contests.contestByMatchId(matchID).path)
            }
        }

        var method: HTTPMethod {
            switch self {
            case .getContestByMatchID(_):
                return .get
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
