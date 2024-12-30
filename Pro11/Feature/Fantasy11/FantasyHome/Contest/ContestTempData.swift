//
//  ContestTempData.swift
//  Pro11
//
//  Created by Ravi Ranjan on 27/12/24.
//

import Foundation
struct ContestData: Identifiable {
    let id = UUID()
    let title: String
    let price: String
    let discountedPrice: String?
    let spotsLeft: String
    let totalSpots: String?
    let firstPrize: String?
    let winnerPercentage: String?
}
