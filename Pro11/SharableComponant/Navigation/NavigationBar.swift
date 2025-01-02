//
//  NavigationBar.swift
//  Pro11
//
//  Created by Ravi Ranjan on 21/12/24.
//

import SwiftUI

struct NavigationBar: View {
    
    var title: String = "Login"
    
    var body: some View {
        HStack {
            // Logo/Image Section
            Image("pro11")
                .resizable()
                .scaledToFit()
                .frame(width: 45, height: 45)
                .clipShape(Circle()) // Makes the image circular
                
                .padding(.trailing, 15)
            
            // Title Section
            Text(title)
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Spacer() // Pushes everything to the left
            
            
        }
        .padding()
        .background(
            LRGradientView()
        )
    }
}

#Preview {
    NavigationBar()
}
