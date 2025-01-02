//
//  RegisterationRoute.swift
//  Pro11
//
//  Created by Ravi Ranjan on 24/12/24.
//

import Foundation

class RegistrationRoute: BaseRoute {
    
    enum RegistrationEndpoint {
        case normal
        case referral
        
        var path: String {
            switch self {
            case .normal:
                return NetworkConstant.buildURL(for: .api, endpointPath: NetworkConstant.Endpoints.Authentication.register.path)
            case .referral:
                return NetworkConstant.buildURL(for: .api, endpointPath: NetworkConstant.Endpoints.Authentication.referalRegister.path)
            }
        }
        var method: HTTPMethod { .post }
    }
    
    let endpoint: RegistrationEndpoint
    
    override var path: String {
        endpoint.path
    }
    
    override var method: HTTPMethod {
        endpoint.method
    }
    init(endpoint: RegistrationEndpoint, headers: [String: String]? = nil, body: Codable? = nil) {
        self.endpoint = endpoint
        super.init(headers: headers, body: body)
    }
}
