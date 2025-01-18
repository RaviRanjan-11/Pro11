//
//  RoundButton.swift
//  Pro11
//
//  Created by Ravi Ranjan on 21/12/24.
//

import SwiftUI


struct RoundButton: View {
    
    enum Width {
        case infinity
        case text
        
        var value: CGFloat? {
            switch self {
            case .infinity:
                return .infinity
            case .text:
                return nil
            }
        }
        
    }
    var title: String = "Create New Account"
    var backgroundColor: Color = .clear
    var foregroundColor: Color = .red
    var cornerRadius: CGFloat = 8
    var strokeColor: Color = Color.red
    var width: Width = .infinity
    var action: () -> Void
    
  
    var body: some View {
        VStack {
            Button(action: {
                action()
            }) {
                Text(title)
                    .foregroundColor(foregroundColor)
                    .fontWeight(.bold)
                    .frame(maxWidth:width.value)
                    .padding()
                    .background(backgroundColor)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .stroke(strokeColor, lineWidth: 1)
                    )
            }
           
        }
        
    }
}

#Preview {
    RoundButton(action: {})
}
