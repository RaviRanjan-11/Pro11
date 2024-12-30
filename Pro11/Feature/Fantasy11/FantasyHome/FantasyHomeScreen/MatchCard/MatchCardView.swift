//
//  MatchCardView.swift
//  Pro11
//
//  Created by Ravi Ranjan on 25/12/24.
//

import SwiftUI

struct MatchCardView: View {
    
    let teamName1: String
    let teamName2: String
    let teamNameS1: String
    let teamNameS2: String
    let time: String
    let prize: String
    let seriesName: String?

    var forUpcomingMatch: Bool = true
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            if forUpcomingMatch {
                HStack {
                    Image("cricket")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text(seriesName ?? "")
                        .font(.caption2)
                        .fontWeight(.bold)
                        .foregroundColor(Color.gray)
                        
                    Spacer()
                    ImageButton(image: ""){}
                }
                .padding(.horizontal, 5)
                .background(RoundedRectangle(cornerRadius: 4).fill(Color.gray.opacity(0.1)))
            }
            
            HStack {
                
                // Team 1
                VStack(alignment: .leading) {
                    HStack {
                        Image("cricketWicket")
                            .resizable()
                            .frame(width: 30, height: 30)
                        Text(teamNameS1)
                            .font(.caption)
                            .fontWeight(.bold)
                    }
                    Text(teamName1)
                        .font(.caption2)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                        .lineLimit(2)
                        .frame(width: 100,alignment: .leading)
                    
                }

                Spacer()

                // VS Image in the Center
                
                VStack{
                    Image("versus")
                        .resizable()
                        .frame(width: 24, height: 24)
                    Text(time)
                        .font(.caption2)
                        .foregroundColor(.gray)
                    
                }

                Spacer()

                // Team 2
                VStack(alignment:.trailing) {
                    HStack {
                        Text(teamNameS2)
                            .font(.caption)
                            .fontWeight(.bold)
                        Image("cricketWicket")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                    Text(teamName2)
                        .font(.caption2)
                        .fontWeight(.bold)
                        .lineLimit(2)
                        .foregroundColor(.gray)
                        .frame(width:100,alignment: .trailing)
                }
            }

           

            Text(prize)
                .font(.caption2)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.horizontal)
                .padding(.vertical, 5)
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .fill(.yellow.opacity(0.2))
                )
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 0, y: 5)
    }
}

#Preview {
    MatchCardView(
        teamName1: "India",
        teamName2: "Australia",
        teamNameS1: "IND",
        teamNameS2: "AUS",
        time: "24:00:00",
        prize: "10 laks",
        seriesName: "Indian Premier League",
        forUpcomingMatch: true
    )
}
