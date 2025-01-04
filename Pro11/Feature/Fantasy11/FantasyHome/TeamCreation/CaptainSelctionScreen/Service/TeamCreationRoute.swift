//
//  TeamCreationRoute.swift
//  Pro11
//
//  Created by Ravi Ranjan on 04/01/25.
//

import Foundation
class TeamCreationRoute:BaseRoute{
    
    enum Endpoint {
        case createuserTeam

        // Generate the path dynamically based on the endpoint
        var path: String {
            switch self {
            case .createuserTeam:
                return NetworkConstant.buildURL(for: .api, endpointPath: NetworkConstant.Endpoints.API.createUserTeam.path)
            }
        }

        // Set HTTP methods for different endpoints if required
        var method: HTTPMethod {
            switch self {
            case .createuserTeam:
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
