//
//  ColorPallate.swift
//  Pro11
//
//  Created by Ravi Ranjan on 04/01/25.
//

import Foundation
import SwiftUI
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        
        var hexSanitized = hex.hasPrefix("#") ? String(hex.dropFirst()) : hex
        
        if hexSanitized.count == 6 {
            hexSanitized = hexSanitized + "FF" // Default to fully opaque if no alpha
        }
        
        if let rgb = UInt32(hexSanitized, radix: 16) {
            let r = Double((rgb >> 24) & 0xff) / 255.0
            let g = Double((rgb >> 16) & 0xff) / 255.0
            let b = Double((rgb >> 8) & 0xff) / 255.0
            let a = Double(rgb & 0xff) / 255.0
            
            self.init(red: r, green: g, blue: b, opacity: a)
        } else {
            self.init(.gray) // fallback color if hex is invalid
        }
    }
}


enum ColorPallate {
    static let primary = Color(hex: "#05143b")
    static let secondary = Color(hex:"#FFFFFF")
    static let mutatedDArkGreen = Color(hex: "#2F4F4F")
    static let darkGreenGroundColor = Color(hex: "#06402B")
    static let gradientRedLeft = Color(hex: "#800000")
    static let gradientRedRight = Color(hex: "#330000")

    

    
    
}
