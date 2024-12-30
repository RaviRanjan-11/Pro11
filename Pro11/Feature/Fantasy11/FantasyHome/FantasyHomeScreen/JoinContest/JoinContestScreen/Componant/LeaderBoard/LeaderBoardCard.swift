//
//  LeaderBoardCard.swift
//  Pro11
//
//  Created by Ravi Ranjan on 27/12/24.
//

import SwiftUI

struct LeaderBoardCard: View {
    
    var image: String = "user"
    var name: String = "John Doe"
    var team: String = "T1"
    init() {}
    var body: some View {
            HStack {
                Image(image)
                    .resizable()
                    .frame(width: 30,height: 30)
                
                Text(name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 10)
                Text(team)
                    .padding(.horizontal, 10)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.gray.opacity(0.4))
                    )
                Spacer()
            }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 2)
                .fill(Color.gray.opacity(0.1))
        )
        
    }
}


#Preview {
    LeaderBoardCard()
}
