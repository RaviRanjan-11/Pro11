//
//  LoginRoute.swift
//  Pro11
//
//  Created by Ravi Ranjan on 21/12/24.
//

import Foundation
 
class LoginRoute: NetworkRoute {
    var headers: [String : String]?
    
    
    var path: String = NetworkConstant.buildURL(for: .auth, authenticationEndpoint: .otp)
    
    var method: HTTPMethod = .post

    var body: Encodable?

    func setBody(_ body: Encodable) {
        self.body = body
    }
    
}

