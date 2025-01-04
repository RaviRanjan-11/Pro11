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



#if DEBUG

// Mock Data
let mockContestTeamPlayersData = ContestTeamPlayersData(
    wktBatter: [
        PlayerModelProperty(
            id: 1,
            playerID: 101,
            playerName: "John Doe",
            teamID: 10,
            teamName: "Team A",
            teamSName: "A",
            seriesID: 5,
            totalPoints: 150,
            totalRuns: 250,
            totalWickets: 5,
            status: 1,
            creditScore: 9.5,
            role: .wkBatter,
            playing: true
        )
    ],
    batter: [
        PlayerModelProperty(
            id: 2,
            playerID: 102,
            playerName: "Jane Smith",
            teamID: 11,
            teamName: "Team B",
            teamSName: "B",
            seriesID: 6,
            totalPoints: 120,
            totalRuns: 300,
            totalWickets: 3,
            status: 1,
            creditScore: 8.8,
            role: .batter,
            playing: false
        )
    ],
    allRounder: [
        PlayerModelProperty(
            id: 3,
            playerID: 103,
            playerName: "Alex Green",
            teamID: 12,
            teamName: "Team C",
            teamSName: "C",
            seriesID: 7,
            totalPoints: 130,
            totalRuns: 210,
            totalWickets: 4,
            status: 1,
            creditScore: 8.0,
            role: .battingAllrounder,
            playing: true
        )
    ],
    bowler: [
        PlayerModelProperty(
            id: 4,
            playerID: 104,
            playerName: "Ethan Brown",
            teamID: 13,
            teamName: "Team D",
            teamSName: "D",
            seriesID: 8,
            totalPoints: 100,
            totalRuns: 50,
            totalWickets: 8,
            status: 1,
            creditScore: 9.0,
            role: .bowler,
            playing: true
        )
    ]
)


var mockPlayerData: PlayerModelProperty =
    PlayerModelProperty(
        id: 1,
        playerID: 101,
        playerName: "John Doe",
        teamID: 10,
        teamName: "Team A",
        teamSName: "A",
        seriesID: 5,
        totalPoints: 150,
        totalRuns: 250,
        totalWickets: 5,
        status: 1,
        creditScore: 9.5,
        role: .wkBatter,
        playing: true)

#endif

