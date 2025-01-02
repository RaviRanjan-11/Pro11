//
//  ConditionalButton.swift
//  Pro11
//
//  Created by Ravi Ranjan on 21/12/24.
//

import SwiftUI

import SwiftUI

struct ConditionalButton: View {
    var title: String
    var action: () -> Void
    var isEnabled: Bool  // Make this a parameter to control enabling state
    var backgroundColor: Color
    var foregroundColor: Color = .white
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .foregroundColor(foregroundColor)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity)
                .padding()
                .background(isEnabled ? backgroundColor : .gray)
                .cornerRadius(8)
        }
        .disabled(!isEnabled)
        .padding(.horizontal, 10)
    }
}

#Preview {
    ConditionalButton(title: "Submit", action: {}, isEnabled: true, backgroundColor: .red)
}
