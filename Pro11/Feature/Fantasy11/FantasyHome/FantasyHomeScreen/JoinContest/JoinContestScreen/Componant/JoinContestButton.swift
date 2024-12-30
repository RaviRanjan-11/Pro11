//
//  JoinContestButton.swift
//  Pro11
//
//  Created by Ravi Ranjan on 27/12/24.
//

import SwiftUI

struct JoinContestButton: View {
    var price: String
    var callback: () -> Void
    var body: some View {
        Button(action: {
            
            callback()
           
        }) {
            Text("Join \(price)")
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(Color.green)
                .cornerRadius(8)
        }
        .padding()
    }
}

#Preview {
    JoinContestButton(price: "123", callback: {})
}
