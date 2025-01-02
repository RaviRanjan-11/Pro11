//
//  TBGradientView.swift
//  Pro11
//
//  Created by Ravi Ranjan on 29/12/24.
//

import SwiftUI

struct TBGradientView: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                Color.red,
                Color(red: 0.5, green: 0, blue: 0) // Dark red
            ]),
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea() // Optional: Makes the gradient cover the whole screen
    }
}

#Preview {
    TBGradientView()
}
