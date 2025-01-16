//
//  Date.swift
//  Pro11
//
//  Created by Ravi Ranjan on 14/01/25.
//

import Foundation

extension String {
    var dateFromTimestamp: String? {
        guard let timestamp = Double(self) else { return nil }
        let date = Date(timeIntervalSince1970: timestamp / 1000) // Convert ms to seconds
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.locale = Locale.current
        dateFormatter.timeZone = TimeZone.current
        return dateFormatter.string(from: date)
    }
}
