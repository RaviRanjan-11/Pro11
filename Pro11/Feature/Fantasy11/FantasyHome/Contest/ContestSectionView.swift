//
//  ContestSectionView.swift
//  Pro11
//
//  Created by Ravi Ranjan on 27/12/24.
//

import SwiftUI

struct ContestSectionView: View {
    let title: String
    let contests: [ContestData]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.headline)
                .padding(.vertical, 5)
                .background(
                    Rectangle()
                        .fill(Color.yellow.opacity(0.3))
                )
            
            ForEach(contests) { contest in
                NavigationLink(destination: JoinContestScreen()) {
                    ContestCardView(data: contest)

                }
            }
        }
    }
}
#Preview {
    ContestSectionView(title: "Running", contests:[
        ContestData(title: "₹7 Lakhs", price: "₹149", discountedPrice: nil, spotsLeft: "6,227 Left", totalSpots: "6,263", firstPrize: "₹60,000", winnerPercentage: "65%")

    ])
}
