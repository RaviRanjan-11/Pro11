//
//  ProfileSettingRow.swift
//  Pro11
//
//  Created by Ravi Ranjan on 24/12/24.
//

import Foundation
import SwiftUI
struct SettingRow: View {
    var title: String
    var icon: String

    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.red)
            Text(title)
                .font(.system(size: 16))
                .foregroundColor(.primary) // Ensure the text color is vibrant
            Spacer()
        }
        .padding()
    }
}


#Preview {
    SettingRow(title: "Profile", icon: "person")
}
