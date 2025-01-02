//
//  ProfileServiceModel.swift
//  Pro11
//
//  Created by Ravi Ranjan on 24/12/24.
//

import Foundation

enum ProfileServiceModel {
    
    enum LogoutServiceRequest: Codable {
        case request(LogoutRequestModel)
        case response(LogoutResponseModel)
        
        var model: Codable {
            switch self {
            case .request(let model):
                return model
            case .response(let model):
                return model
            }
        }
    }
    
    struct LogoutRequestModel: Codable {
        let token: String
    }
    
    struct LogoutResponseModel: Codable {
        let success: Bool
        let message: String
        let statusCode: Int
        let data: Bool
    }
}
