//
//  LoginRoute.swift
//  Pro11
//
//  Created by Ravi Ranjan on 21/12/24.
//

import Foundation

/// A class representing the network route for the login feature.
///
/// This class conforms to the `NetworkRoute` protocol and is responsible for
/// defining the endpoint, HTTP method, headers, and body for the OTP request during login.
class LoginRoute: BaseRoute {
    enum Endpoint {
        case otp

        // Generate the path dynamically based on the endpoint
        var path: String {
            switch self {
            case .otp:
                return NetworkConstant.buildURL(for: .auth, endpointPath: NetworkConstant.Endpoints.Authentication.otp.path)
            }
        }

        // Set HTTP methods for different endpoints if required
        var method: HTTPMethod {
            switch self {
            case .otp:
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

    init(endpoint: Endpoint, headers: [String: String]? = nil, body: Codable? = nil) {
        self.endpoint = endpoint
        super.init(headers: headers, body: body)
    }
}



