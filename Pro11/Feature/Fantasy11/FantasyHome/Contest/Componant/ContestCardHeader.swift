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
    var teamA: String = "IND"
    var teamB: String = "AUS"
    var teamAImage: String = "india"
    var teamBImage: String = "australia"

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
            
            Spacer()
            
            VStack(alignment: .center) {
                HStack {
                   
                    
                    Image(teamAImage)
                        .resizable()
                        .frame(width: 32, height: 32)
                        .scaledToFill()
                        .background(Circle().fill(.clear))
                    
                    
                    Text(teamA)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    
                    Image("vs-white")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(.horizontal, 10)
                        .offset(y: 5)
                    
                    Text(teamB)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Image(teamBImage)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .scaledToFill()
                        .background(Circle().fill(.clear))
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
            LRDGradientView()
        )
    }
}

#Preview {
    ContestHeaderView( action: {})
}
