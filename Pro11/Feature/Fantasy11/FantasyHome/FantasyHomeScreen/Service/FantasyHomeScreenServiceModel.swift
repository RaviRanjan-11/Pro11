//
//  FantasyHomeScreenServiceModel.swift
//  Pro11
//
//  Created by Ravi Ranjan on 25/12/24.
//

import Foundation


// MARK: - DataClass
struct FantasyHomeScreenServiceResponseModel: Codable {
    let pageSize, currPage, prevPage, nextPage: Int?
    let totalPages, totalRecords: Int?
    let hasMore: Bool?
    let data: [MatchDataModel]?
}

// MARK: - Datum
struct MatchDataModel: Codable {
    let id: Int?
    let matchID: MatchID?
    let seriesID: Int?
    let matchType: String?
    let seriesName: String?
    let isActive: Bool?
    let startDate, endDate: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case matchID = "matchId"
        case seriesID = "seriesId"
        case matchType, seriesName, isActive, startDate, endDate
    }
}

// MARK: - MatchID
struct MatchID: Codable {
    let id: Int?
    let seriesName: String?
    let matchDesc, matchFormat, startDate, endDate: String?
    let state, status: String?
    let team1, team2: Team?
    let currBatTeamID: String?
    let series: Series?
    let timeAnnounced: Bool?

    enum CodingKeys: String, CodingKey {
        case id, seriesName, matchDesc, matchFormat, startDate, endDate, state, status, team1, team2
        case currBatTeamID = "currBatTeamId"
        case series, timeAnnounced
    }
}

// MARK: - Series
struct Series: Codable {
    let id: Int?
    let name, startDt, endDt, type: String?
}

// MARK: - Team
struct Team: Codable {
    let id, teamID: Int?
    let teamName, teamSName: String?
    let imageID: Int?
    let countryName: String?

    enum CodingKeys: String, CodingKey {
        case id
        case teamID = "teamId"
        case teamName, teamSName
        case imageID = "imageId"
        case countryName
    }
}
