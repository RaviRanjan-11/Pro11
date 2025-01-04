// TeamSelectionRoute.swift
// Pro11
//
// Created by Ravi Ranjan on 04/01/25.
//

import Foundation

enum ListOrder: String, Codable {
    case asc
    case desc
    var orderValue: Bool {
        return self == .asc
    }
}

enum PlayerSortable: String, Codable {
    case name
    case rating
    case points
    case wins
}

class TeamSelectionRoute: BaseRoute {
    
    enum Endpoint {
        case getPlayerForContestWith(contestId: String, order: ListOrder, sortedBy: PlayerSortable)
        
        var path: String {
            switch self {
            case .getPlayerForContestWith(let contestId, let order, let sortedBy):
                return NetworkConstant.buildURL(for: .cricket,
                                                endpointPath: NetworkConstant.Endpoints.Cricket.getPlayerForContest(matchid: contestId, sortedBy: sortedBy.rawValue.uppercased(), isDescending: order.orderValue).path)
            }
        }
        
        var method: HTTPMethod {
            switch self {
            case .getPlayerForContestWith:
                return .get
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
    
    init(endpoint: Endpoint, headers: [String: String]? = nil, body: Codable? = nil) {
        self.endpoint = endpoint
        super.init(headers: headers, body: body)
    }
}
