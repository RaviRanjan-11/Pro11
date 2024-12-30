//
//  ContestCardHeader.swift
//  Pro11
//
//  Created by Ravi Ranjan on 27/12/24.
//

import SwiftUI

struct ContestHeaderView: View {
    var title: String = "Login"
    var action: () -> Void
    
    var body: some View {
        
        HStack {

            Button(action: {
                action()
            }) {
                Image(systemName: "chevron.backward")
                    .resizable()
                    .frame(width: 10, height: 16)
                    .font(.title)
                    .foregroundColor(.white)
                

            }
//            .padding(.trailing, 20)
            
            Spacer()
            
            VStack(alignment: .leading) {
                HStack {
                    // Team A and Team B
                    Image("india")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    
                    Text("IND")
                        .fontWeight(.bold)
                        .foregroundColor(.white)

                    Text("vs")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .offset(y: 2)
                    
                    Text("AUS")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Image("australia")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                }
                
                Text("22h 45m left")
                    .font(.caption)
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 20)
            Spacer()
            
           
        }
        .padding()
        .background(
            LRGradientView()
        )
    }
}

#Preview {
    ContestHeaderView( action: {})
}
