//
//  BaseResponse.swift
//  Pro11
//
//  Created by Ravi Ranjan on 23/12/24.
//

import Foundation


struct BaseResponse<T: Codable>: Codable {
    let message: String
    let success: Bool
    let statusCode: Int
    let data: T?
    let error: ResponseError?
}

struct ResponseError: Codable {
    let code: Int?
    let message: String?
}

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
            return true
    }

    
    func hash(into hasher: inout Hasher) {}
    
    public var hashValue: Int {
            return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if !container.decodeNil() {
                    throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
            }
    }

    public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encodeNil()
    }
}
