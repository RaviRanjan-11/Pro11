//
//  ProfileRoute.swift
//  Pro11
//
//  Created by Ravi Ranjan on 24/12/24.
//

import Foundation

class ProfileRoute: NetworkRoute {

    var headers: [String : String]?
    
    var path: String = NetworkConstant.buildURL(for: .auth, endpointPath: NetworkConstant.Endpoints.Authentication.logout.path)
    
    var method: HTTPMethod = .post

    var body: Codable?

    func setBody(_ body: Codable) {
        self.body = body
    }
    
    func setHeaders(_ headers: [String : String]) {
        self.headers = headers
    }
}
