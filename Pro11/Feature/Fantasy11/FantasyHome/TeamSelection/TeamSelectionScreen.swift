//
//  TeamSelectionScreen.swift
//  Pro11
//
//  Created by Ravi Ranjan on 28/12/24.
//

import SwiftUI

struct TeamSelectionScreen: View {
    
    var body: some View {
        
        
        VStack {
            
            Button(action: {
//                action()
            }) {
                Image("left-arrow")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .font(.title)
                    
                

            }
            .padding(.trailing, 20)
        }
        
    }
}

#Preview {
    TeamSelectionScreen()
}
