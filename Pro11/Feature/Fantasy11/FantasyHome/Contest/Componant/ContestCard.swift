//
//  ContestCard.swift
//  Pro11
//
//  Created by Ravi Ranjan on 27/12/24.
//

import SwiftUI

struct ContestCardView: View {
    let data: ContestModelData
    var onClickJoin: (() -> Void)
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                HStack (alignment: .center){
                    HStack {
                        Image(systemName: "checkmark.seal.fill")
                            .foregroundColor(.green)
                        Text(data.priceType ?? "")
                            .font(.caption)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                }
                
                
                HStack {
                    
                    Text("₹ " + (data.prizePool?.toString ?? "") )
                        .font(.headline)
                    Spacer()
                    Button {
                        onClickJoin()
                    }label: {
                        Text("Join @ " + data.joiningPrice.actualPrice)
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.all, 5)
                                .background(
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(.green)
                                )
                    }
                   
                }
               
                GradientProgressBar(maxValue: data.totalSpot ?? 0, currentValue: data.filledSpot)
                
                HStack {
                    HStack {
                        Image("medal")
                            .resizable()
                            .frame(width: 20,height: 20)
                        Text("₹ \(data.firstPrice)")
                            .font(.callout)
                            .fontWeight(.semibold)
                    }
                    HStack {
                        Image("cup")
                            .resizable()
                            .frame(width: 20,height: 20)
                        Text("\(data.winner) %")
                            .font(.callout)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                    }
                    HStack {
                        Text("M")
                            .font(.caption)
                            .padding(.all, 2)
                            .background(
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(Color.white)
                                    .border(Color.gray, width: 1)
                                    
                            )
                        Text("up to \(data.maxTeamJoinByUser)")
                            .font(.callout)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding(.top, 10)
                
            }
        
            
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 1)
        )
        
    }
}
#Preview{
    ContestCardView(data: ContestModelData(id: 435, matchID: 534, seriesID: 675567, contestType: "Safe", contestDescription: "Another`", prizePool: 657675, status: "resr", joiningPrice: 345, isActive: false, winner: 4354, priceType: "Match is mathc", totalSpot: 765, filledSpot: 435, maxTeamJoinByUser: 45, firstPrice: 5435435), onClickJoin: {})
}


extension Int {
    var toString: String {
       return "\(self)"
    }
}
