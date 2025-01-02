//
//  LRGradientView.swift
//  Pro11
//
//  Created by Ravi Ranjan on 29/12/24.
//

import SwiftUI

struct LRGradientView: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                Color(red: 0.7, green: 0, blue: 0),
                Color(red: 0.4, green: 0, blue: 0) // Dark red
            ]),
            startPoint: .leading,
            endPoint: .trailing
        )
        .ignoresSafeArea() 
    }
}
#Preview {
    LRGradientView()
}
