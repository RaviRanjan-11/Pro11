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
    var teamAImage: String
    var teamBImage: String
    var leftTime: String
    var contestId: String
    
    init(teamA: String, teamB: String, teamAImage: String, teamBImage: String, leftTime: String, contestId: String) {
        self.teamA = teamA
        self.teamB = teamB
        self.teamAImage = teamAImage
        self.teamBImage = teamBImage
        self.leftTime = leftTime
        self.contestId = contestId
    }
}

#if DEBUG
extension ContestHeaderData {
    static let mockData = ContestHeaderData(
        teamA: "IND",
        teamB: "AUS",
        teamAImage: "india_flag",
        teamBImage: "australia_flag",
        leftTime: "01:30:00", contestId: "fdsfds"
    )
}
#endif
