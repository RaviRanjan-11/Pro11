//
//  TeamRoute.swift
//  Pro11
//
//  Created by Ravi Ranjan on 17/01/25.
//

import Foundation

class TeamRoute: BaseRoute {
    enum Endpoint {
        case userTeamByMatch(String,String)
        case getContestByMatchID(String)
        case joinContestWith(contestID:String, userTeamId:String)


        // Generate the path dynamically based on the endpoint
        var path: String {
            switch self {
            case .userTeamByMatch(let matchId, let userid):
                return NetworkConstant.buildURL(for: .api, endpointPath: NetworkConstant.Endpoints.API.userTeamByMatch(matchId: matchId, userId: userid).path)
                
            case .getContestByMatchID(let matchID):
                return NetworkConstant.buildURL(for: .contests, endpointPath: NetworkConstant.Endpoints.Contests.contestByMatchId(matchID).path)
                
            case .joinContestWith(let contestId, let userTeamId):
                return NetworkConstant.buildURL(for: .api, endpointPath: NetworkConstant.Endpoints.API.joinContestWith(contestID: contestId, userTeamId: userTeamId).path)
            }
        }

        // Set HTTP methods for different endpoints if required
        var method: HTTPMethod {
            switch self {
            case .userTeamByMatch:
                return .get
            case .getContestByMatchID(_):
                return .get
            case .joinContestWith(_, _):
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

    init(endpoint: Endpoint, headers: [String: String]? = nil, body: Codable? = nil, method: HTTPMethod = .get) {
        self.endpoint = endpoint
        super.init(headers: headers, body: body)
    }
}
