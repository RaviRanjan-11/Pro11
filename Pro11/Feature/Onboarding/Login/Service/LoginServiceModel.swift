//
//  LoginServiceModel.swift
//  Pro11
//
//  Created by Ravi Ranjan on 23/12/24.
//

import Foundation


// MARK: - LoginResponse

struct LoginRequest:Codable{
    let emailTo: String
}


// MARK: - DataClass
struct LoginData: Codable {
    let token, data: String
}
