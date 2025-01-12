//
//  JoinContestCard.swift
//  Pro11
//
//  Created by Ravi Ranjan on 27/12/24.
//

import SwiftUI


struct JoinContestCard: View {
    var totalSpot: Int = 0
    var filledSpot: Int = 0
    var contestPrice: String = "FREE"
    var prizePool: String = "149"
    var winnerPercentage: String = "65%"
    var prizeUpto: String = "0"
    var contestType: String = "DESCRIPTION"
    var contestData: ContestModelData?
    var joinContestCallback: (() -> Void)? // Callback closure

    init(contestData: ContestModelData?, joinContestCallback: (() -> Void)? = nil) {
        self.contestData = contestData
        self.joinContestCallback = joinContestCallback
    }

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "checkmark.seal.fill")
                    .tint(Color.green)
                Text(contestData?.contestType.uppercased() ?? contestType)
                    .font(.caption)
                    .fontWeight(.semibold)
                Spacer()
            }

            GradientProgressBar(maxValue: contestData?.totalSpot ?? totalSpot, currentValue: contestData?.filledSpot ?? filledSpot)

            JoinContestButton(price: contestData?.joiningPrice.actualPrice ?? contestPrice) {
                joinContestCallback?()
            }

            HStack {
                IconImageWithTitleAndValue(imageName: "first", title: "Prizes", value: prizePool)
                IconImageWithTitleAndValue(imageName: "first", title: "winner", value: winnerPercentage)
                IconImageWithTitleAndValue(imageName: "first", title: "Prizes", value: prizeUpto)
                Spacer()
            }
        }
        .padding(.horizontal)
        .padding(.top, 10)
    }
}

#Preview {
    JoinContestCard(contestData: nil)
}
