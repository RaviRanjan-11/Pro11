//
//  LeaderBoard.swift
//  Pro11
//
//  Created by Ravi Ranjan on 27/12/24.
//

import SwiftUI

struct LeaderBoard :View {
    
    var teamCount: Int = 240
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                Text("All Teams")
                    .font(.headline)
                    .fontWeight(.bold)
                Text("\(teamCount)")
                    .font(.caption)
                    .fontWeight(.semibold)
                Spacer()
            }
            .foregroundColor(.gray)
            .padding(.horizontal)
            ScrollView(showsIndicators: false){
                
                ForEach(0 ..< 10) { item in
                    LeaderBoardCard()
                        .padding(.horizontal)
                        .shadow(color: .red.opacity(0.1),radius: 1)

                }
                
            }
        }
    }
}


#Preview {
    LeaderBoard()
}

