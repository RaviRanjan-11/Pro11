//
//  NavigationBarBack.swift
//  Pro11
//
//  Created by Ravi Ranjan on 21/12/24.
//

import SwiftUI

struct NavigationBarBack: View {
    var title: String = "Login"
    var action: () -> Void
    
    var body: some View {
        
        HStack {

            Button(action: {
                action()
            }) {
                Image("left-arrow")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .font(.title)
                    .foregroundColor(.white)
                

            }
            .padding(.trailing, 20)

            Text(title)
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Spacer()
            
            Image("pro11")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .clipShape(Circle()) // Makes the image circular
                .overlay(
                    Circle()
                        .stroke(Color.red, lineWidth: 2) // Add a border to the image
                )
        }
        .padding()
        .background(
            LRGradientView()
        )
    }
}

#Preview {
    NavigationBarBack( action: {})
}
