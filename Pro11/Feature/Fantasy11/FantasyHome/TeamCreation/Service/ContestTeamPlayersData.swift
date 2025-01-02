//
//  ContestTeamPlayersData.swift
//  Pro11
//
//  Created by Ravi Ranjan on 02/01/25.
//

import Foundation
// MARK: - DataClass
struct ContestTeamPlayersData: Codable {
    let wktBatter, batter, allRounder, bowler: [PlayerModelProperty]

    enum CodingKeys: String, CodingKey {
        case wktBatter
        case batter = "Batter"
        case allRounder
        case bowler = "Bowler"
    }
}

// MARK: - Batter
struct PlayerModelProperty: Codable {
    let id, playerID: Int
    let playerName: String
    let teamID: Int
    let teamName: String
    let teamSName: String
    let seriesID, totalPoints, totalRuns, totalWickets: Int
    let status: Int
    let creditScore: Double
    let role: Role
    let playing: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case playerID = "playerId"
        case playerName
        case teamID = "teamId"
        case teamName, teamSName
        case seriesID = "seriesId"
        case totalPoints, totalRuns, totalWickets, status, creditScore, role, playing
    }
}

enum Role: String, Codable {
    case batter = "Batter"
    case battingAllrounder = "Batting Allrounder"
    case bowler = "Bowler"
    case bowlingAllrounder = "Bowling Allrounder"
    case wkBatter = "WK-Batter"
}

