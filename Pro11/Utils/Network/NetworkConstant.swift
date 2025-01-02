//
//  NetworkConstant.swift
//  Pro11
//
//  Created by Ravi Ranjan on 21/12/24.
//

import Foundation

enum Server {
    case production
    case development
    
    var baseURL: String {
        switch self {
        case .production: return NetworkConstant.productionURL
        case .development: return NetworkConstant.stagingURL
        }
    }
}


final class NetworkConstant {
    
    static let stagingURL = "https://test.api.progroww.live"
    static let productionURL = "https://api.progroww.live"
    
    enum Routes {
        case auth
        case cricket
        case wallet
        case users
        case api
        case contests
        
        var path: String {
            switch self {
            case .auth: return "/auth"
            case .cricket: return "/api/cricket"
            case .wallet: return "/wallet"
            case .users: return "/users"
            case .api: return "/api"
            case .contests: return "/api/contests"
                
            }
        }
    }
    
    enum Endpoints {
        
        enum Authentication {
            case otp
            case login
            case logout
            case refreshToken
            case register
            case referalRegister
            
            var path: String {
                switch self {
                case .otp: return "/otp"
                case .login: return "/sign-in"
                case .logout: return "/logout"
                case .refreshToken: return "/refresh-token"
                case .register: return "/sign-up"
                case .referalRegister: return "/sign-up/referral-code"
                }
            }
        }
        
        enum Cricket {
            case upcomingMatches(String)
            
            var path: String {
                switch self {
                case .upcomingMatches(let limit): return "/upcomingMatches/?page=0&limit=\(limit)&isActive=true"
                }
            }
        }
        
        enum Contests {
            case contestByMatchId(String)
            
            
            var path: String {
                switch self {
                case .contestByMatchId(let matchId): return "/by-match/\(matchId)"
                }
            }
            
        }

    }
    
    static func buildURL(for route: Routes, endpointPath: String) -> String {
            let routePath = route.path
            return routePath + endpointPath
    }
}
