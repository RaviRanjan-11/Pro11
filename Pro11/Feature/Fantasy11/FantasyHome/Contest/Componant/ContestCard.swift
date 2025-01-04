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
                        Text("Join @ " + data.joiningPrice.toString)
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
                
                
            }
            
            Spacer()

            
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 1)
        )
        
    }
}
#Preview{
    ContestCardView(data: ContestModelData(id: 435, matchID: 534, seriesID: 675567, contestType: "sef", contestDescription: "fesfsd`", prizePool: 657675, status: "resr", joiningPrice: 345, isActive: false, winner: 4354, priceType: "Dssfsds", totalSpot: 765, filledSpot: 435, maxTeamJoinByUser: 45, firstPrice: 5435435), onClickJoin: {})
}


extension Int {
    var toString: String {
       return "\(self)"
    }
}
