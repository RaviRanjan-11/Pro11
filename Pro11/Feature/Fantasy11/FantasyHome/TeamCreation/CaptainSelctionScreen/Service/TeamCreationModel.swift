//
//  TeamCreationModel.swift
//  Pro11
//
//  Created by Ravi Ranjan on 04/01/25.
//

import Foundation

struct CreateTeamRequest: Codable {
    let userId: String
    let teamName: String
    let matchId: Int
    let captainId: Int
    let viceCaptainId: Int
    let playerIds: [Int]
}

struct CreateTeamResponse: Codable {
    
    var id: Int?
    var userId: Int?
    var teamName: String?
   
}
