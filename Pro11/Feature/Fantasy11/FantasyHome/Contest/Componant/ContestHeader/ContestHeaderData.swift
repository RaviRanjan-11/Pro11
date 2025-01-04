//
//  ContestHeaderData.swift
//  Pro11
//
//  Created by Ravi Ranjan on 02/01/25.
//

import Foundation

struct ContestHeaderData {
    var teamA: String
    var teamB: String
    var steamA: String
    var steamB: String
    var teamAImage: String
    var teamBImage: String
    var leftTime: String
    var contestId: String
    var seriesId: String
    
    init(teamA: String, teamB: String, teamAImage: String, teamBImage: String, leftTime: String, contestId: String, steamA: String = "", steamB: String = "", seriesId:String = "") {
        self.teamA = teamA
        self.teamB = teamB
        self.teamAImage = teamAImage
        self.teamBImage = teamBImage
        self.leftTime = leftTime
        self.contestId = contestId
        self.steamA = steamA
        self.steamB = steamB
        self.seriesId = seriesId
    }
}

#if DEBUG
extension ContestHeaderData {
    static let mockData = ContestHeaderData(
        teamA: "IND",
        teamB: "AUS",
        teamAImage: "india_flag",
        teamBImage: "australia_flag",
        leftTime: "01:30:00",
        contestId: "fdsfds",
        steamA: "steamA",
        steamB: "steamB"
    )
}
#endif
