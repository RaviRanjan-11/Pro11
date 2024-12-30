//
//  GradientProgressBar.swift
//  Pro11
//
//  Created by Ravi Ranjan on 27/12/24.
//

import SwiftUI

struct GradientProgressBar: View {
    var maxValue: Int
    var currentValue: Int
    let gradientColors = Gradient(colors: [Color.red.opacity(0.7), Color.orange.opacity(0.7)])
    
    var progress: Double {
        guard maxValue > 0 else { return 0 }
        return Double(min(currentValue, maxValue)) / Double(maxValue)
    }
    
    var body: some View {
        VStack {
            HStack {
                
                Text("\(maxValue -  currentValue) Left")
                    .font(.subheadline)
                    .foregroundColor(.red)
                Spacer()
                Text("\(maxValue ) Spot")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
            }
            
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 5)
                    
                    RoundedRectangle(cornerRadius: 2)
                        .fill(LinearGradient(
                            gradient: gradientColors,
                            startPoint: .leading,
                            endPoint: .trailing
                        ))
                        .frame(width: CGFloat(progress) * geometry.size.width, height: 5)
                }
            }
            .frame(height: 5)
            
        }
    }
}

#Preview {
    GradientProgressBar(maxValue: 100, currentValue: 32)
}
