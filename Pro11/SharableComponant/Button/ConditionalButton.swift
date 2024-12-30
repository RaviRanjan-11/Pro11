//
//  CondtionalButton.swift
//  Pro11
//
//  Created by Ravi Ranjan on 21/12/24.
//

import SwiftUI

struct ConditionalButton: View {
    var title: String
    var action: () -> Void
    var isEnabled: Bool
    var backgroundColor: Color
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .foregroundColor(.white)
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
    CondtionalButton(title: "Button", action: {}, isEnabled: true, backgroundColor: .red)
}


