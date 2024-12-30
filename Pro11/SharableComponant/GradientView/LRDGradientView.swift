//
//  LRDGradient.swift
//  Pro11
//
//  Created by Ravi Ranjan on 29/12/24.
//

import SwiftUI

struct LRDGradientView: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                Color(red: 0.5, green: 0, blue: 0),
                Color(red: 0.2, green: 0, blue: 0)
            ]),
            startPoint: .leading,
            endPoint: .trailing
        )
        .ignoresSafeArea()
    }
}

#Preview {
    LRDGradientView()
}
