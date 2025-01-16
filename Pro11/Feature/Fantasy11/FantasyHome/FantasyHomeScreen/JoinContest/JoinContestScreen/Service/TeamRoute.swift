//
//  TeamRoute.swift
//  Pro11
//
//  Created by Ravi Ranjan on 17/01/25.
//

import Foundation

class TeamRoute: BaseRoute {
    enum Endpoint {
        case userTeamByMatch(String,String)
        

        // Generate the path dynamically based on the endpoint
        var path: String {
            switch self {
            case .userTeamByMatch(let matchId, let userid):
                return NetworkConstant.buildURL(for: .api, endpointPath: NetworkConstant.Endpoints.API.userTeamByMatch(matchId: matchId, userId: userid).path)
            }
        }

        // Set HTTP methods for different endpoints if required
        var method: HTTPMethod {
            switch self {
            case .userTeamByMatch:
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
