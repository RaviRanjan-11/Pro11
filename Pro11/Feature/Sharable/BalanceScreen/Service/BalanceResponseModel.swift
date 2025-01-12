//
//  BalanceResponseModel.swift
//  Pro11
//
//  Created by Ravi Ranjan on 11/01/25.
//

import Foundation


struct CreateBalanceOrderRequestModel: Codable {
    let amount: String
}

struct BalanceResponseModel: Codable {
    let id: Int
    let bonusAmount, currentBalance: Double
}


struct CreateOrderResponseModel: Codable {
    let key, id, entity: String
    let amount: Int
    let currency, status, receipt: String
    let walletID, userID: Int

    enum CodingKeys: String, CodingKey {
        case key, id, entity, amount, currency, status, receipt
        case walletID = "walletId"
        case userID = "userId"
    }
}
