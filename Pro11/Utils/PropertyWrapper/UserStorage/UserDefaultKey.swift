//
//  UserDefaultKey.swift
//  Pro11
//
//  Created by Ravi Ranjan on 24/12/24.
//

import Foundation

struct UserStorage {
    
    @Storage(key: "isLoggedIn", defaultValue: false)
    static var isLoggedIn: Bool
    
    @Storage(key: "token", defaultValue: "")
    static var token: String
    
    @Storage(key: "user_id", defaultValue: "")
    static var userId: String

    
    static func clearToken() {
        token = ""
    }

}

