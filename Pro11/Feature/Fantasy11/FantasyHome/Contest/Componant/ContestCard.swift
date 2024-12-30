//
//  ContestCard.swift
//  Pro11
//
//  Created by Ravi Ranjan on 27/12/24.
//

import SwiftUI

struct ContestCardView: View {
    let data: ContestData
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(.green)
                    Text(data.title)
                        .font(.headline)
                    Spacer()
                }
                Text(data.spotsLeft)
                    .font(.caption)
                    .foregroundColor(.red)
                
                if let firstPrize = data.firstPrize {
                    HStack {
                        Image(systemName: "crown.fill")
                            .foregroundColor(.yellow)
                        Text("1st Prize: \(firstPrize)")
                            .font(.caption)
                        Spacer()
                        Text("Winners: \(data.winnerPercentage ?? "--")")
                            .font(.caption)
                    }
                }
            }
            
            Spacer()
            
            VStack {
                if let discountedPrice = data.discountedPrice {
                    Text(data.price)
                        .strikethrough()
                        .foregroundColor(.gray)
                }
                Text(data.discountedPrice ?? data.price)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(8)
                    .background(Color.green)
                    .clipShape(Capsule())
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
    ContestCardView(data: ContestData(title: "₹11 Crores", price: "₹49", discountedPrice: "₹1", spotsLeft: "29,96,036 Left", totalSpots: "30,33,645", firstPrize: "₹1 Cr", winnerPercentage: "62%"))
}
