//
//  OTPServiceModel.swift
//  Pro11
//
//  Created by Ravi Ranjan on 23/12/24.
//

import Foundation

struct OTPServiceRequestModel: Codable{
    let username: String
    let otp: String
    let token: String
}
 


// MARK: - DataClass
struct OTPResponse: Codable {
    let accessToken: String
    let accessTokenExpiry: Int
    let tokenType: String
    let user: User

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case accessTokenExpiry = "access_token_expiry"
        case tokenType = "token_type"
        case user
    }
}

// MARK: - User
struct User: Codable {
    let userID: Int
    let username, email: String
    let phoneNo: String?
    let role: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case username, email, phoneNo, role
    }
}


