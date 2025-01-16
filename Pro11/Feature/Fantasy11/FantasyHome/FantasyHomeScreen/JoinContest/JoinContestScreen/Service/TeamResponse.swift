//
//  TeamResponse.swift
//  Pro11
//
//  Created by Ravi Ranjan on 17/01/25.
//

import Foundation

// MARK: - Datum
struct TeamResponse: Codable {
    let teamID: Int
    let teamName: String
    let batterCount, team1PlayerCount, team2PlayerCount: Int
    let team1Name, team2Name: String
    let bowlerCount, wkCount, allRounder: Int
    let captain, viceCaptain: TeamResponseCaptainViceCaptain
    let totalPoints: Int

    enum CodingKeys: String, CodingKey {
        case teamID = "teamId"
        case teamName, batterCount, team1PlayerCount, team2PlayerCount, team1Name, team2Name, bowlerCount, wkCount, allRounder, captain, viceCaptain, totalPoints
    }
}

// MARK: - Captain
struct TeamResponseCaptainViceCaptain: Codable {
    let id: Int
    let name, role: String
    let doB: String?
    let teamID: Int
    let battingStyle: String
    let bowlingStyle, captain: String?
    let creditScore: Double
    let image, playerID, seriesID, squadID: Int

    enum CodingKeys: String, CodingKey {
        case id, name, role, doB
        case teamID = "teamId"
        case battingStyle, bowlingStyle, captain, creditScore, image
        case playerID = "playerId"
        case seriesID = "seriesId"
        case squadID = "squadId"
    }
}
