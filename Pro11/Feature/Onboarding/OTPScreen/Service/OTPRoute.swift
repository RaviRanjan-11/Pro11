//
//  OTPRoute.swift
//  Pro11
//
//  Created by Ravi Ranjan on 21/12/24.
//

import Foundation

/// A class representing the network route for OTP verification during login.
///
/// This class conforms to the `NetworkRoute` protocol and defines the API endpoint,
/// HTTP method, headers, and body for handling OTP-based authentication.
class OTPRoute: NetworkRoute {

    // MARK: - Properties

    /// The headers for the network request.
    ///
    /// These may include content-type, authorization, or other necessary headers.
    var headers: [String: String]?
    
    /// The path for the network request.
    ///
    /// Uses `NetworkConstant` to dynamically generate the URL for the authentication service and login endpoint.
    var path: String = NetworkConstant.buildURL(for: .auth, endpointPath: NetworkConstant.Endpoints.Authentication.login.path)
    
    /// The HTTP method for the network request.
    ///
    /// Defaults to `POST` since OTP verification requires data submission.
    var method: HTTPMethod = .post

    /// The body of the network request.
    ///
    /// A `Codable` object containing the request payload, such as the OTP and related information.
    var body: Codable?

    // MARK: - Methods

    /// Sets the body for the network request.
    ///
    /// - Parameter body: A `Codable` object containing the data to be sent in the request body.
    func setBody(_ body: Codable) {
        self.body = body
    }
    
    /// Sets the headers for the network request.
    ///
    /// - Parameter headers: A dictionary of key-value pairs for the request headers.
    func setHeaders(_ headers: [String: String]) {
        self.headers = headers
    }
}
