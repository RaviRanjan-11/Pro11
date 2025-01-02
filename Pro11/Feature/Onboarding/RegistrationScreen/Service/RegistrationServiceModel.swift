//
//  RegistrationServiceModel.swift
//  Pro11
//
//  Created by Ravi Ranjan on 24/12/24.
//

import Foundation

struct RegistrationServiceRequestModel: Codable {
    let username: String
    let email: String
    let phoneNo: String
    let acceptedTermsAndConditions: String
    let referralCode: String?
}


// MARK: - DataClass
struct RegistrationServiceResponsetModel: Codable {
    let id: Int
    let userName, emailID, phone: String
    let otp: JSONNull?
    let roles: String
    let otpExpirationTime: JSONNull?
    let createdAt, updatedAt: String
    let deletedAt: JSONNull?
    let referralCode: ReferralCode
    let acceptedTermsAndConditions: Bool

    enum CodingKeys: String, CodingKey {
        case id, userName
        case emailID = "emailId"
        case phone, otp, roles, otpExpirationTime, createdAt, updatedAt, deletedAt, referralCode, acceptedTermsAndConditions
    }
}

// MARK: - ReferralCode
struct ReferralCode: Codable {
    let id: Int
    let code, createdAt: String
}
