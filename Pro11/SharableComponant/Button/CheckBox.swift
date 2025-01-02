//
//  CheckBox.swift
//  Pro11
//
//  Created by Ravi Ranjan on 21/12/24.
//

import SwiftUI

struct CheckBox: View {
    @Binding var isChecked: Bool
    var callback: (Bool) -> Void

    var body: some View {
        HStack {
            Button(action: {
                isChecked.toggle()
                callback(isChecked)
            }) {
                Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                    .foregroundColor(isChecked ? .red : .gray)
                    .font(.system(size: 20))
            }
        }
    }
}

#Preview {
    CheckBox(isChecked: .constant(false), callback: { isChecked in
        print("Checkbox state changed: \(isChecked)")
    })
}
