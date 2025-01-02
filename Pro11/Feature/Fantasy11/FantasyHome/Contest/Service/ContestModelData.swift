//
//  ContestModelData.swift
//  Pro11
//
//  Created by Ravi Ranjan on 29/12/24.
//

import Foundation

struct ContestModelData: Codable {
    let id, matchID: Int
        let seriesID: Int?
        let contestType, contestDescription: String
        let prizePool: Int?
        let status: String
        let joiningPrice: Int
        let isActive: Bool
        let winner: Int
        let priceType: String?
        let totalSpot: Int?
        let filledSpot, maxTeamJoinByUser, firstPrice: Int

        enum CodingKeys: String, CodingKey {
            case id
            case matchID = "matchId"
            case seriesID = "seriesId"
            case contestType, contestDescription, prizePool, status, joiningPrice, isActive, winner, priceType, totalSpot, filledSpot, maxTeamJoinByUser, firstPrice
        }
}

