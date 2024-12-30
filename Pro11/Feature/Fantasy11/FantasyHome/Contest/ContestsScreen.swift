//
//  ContestsScreen.swift
//  Pro11
//
//  Created by Ravi Ranjan on 23/12/24.
//

import SwiftUI
struct ContestsScreen: View {
    @State private var discountedContests: [ContestData] = []
    @State private var trendingContests: [ContestData] = []
    @State private var naviagteToJoinContest: Bool = false
    @Environment(\.presentationMode) var presentationManager
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Header Section
            ContestHeaderView() {
                presentationManager.wrappedValue.dismiss()
            }
            
        
            // Contest Section
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Discounted Entry Section
                    ContestSectionView(title: "Discounted Entry", contests: discountedContests)
                    
                    // Trending Now Section
                    ContestSectionView(title: "Trending Now", contests: trendingContests)
                        
                    
                }
                .padding(.horizontal)
                
            }
        }
        .background(Color(.systemBackground))
        .onAppear {
            loadTempContests()
        }
    }
    
    private func loadTempContests() {
        
        discountedContests = [
            ContestData(title: "₹11 Crores", price: "₹49", discountedPrice: "₹1", spotsLeft: "29,96,036 Left", totalSpots: "30,33,645", firstPrize: "₹1 Cr", winnerPercentage: "62%"),
            ContestData(title: "₹1 Crore", price: "₹39", discountedPrice: "₹1", spotsLeft: "3,44,937 Left", totalSpots: "3,46,500", firstPrize: "₹4.50L", winnerPercentage: "59%")
        ]
        
        trendingContests = [
            ContestData(title: "₹7 Lakhs", price: "₹149", discountedPrice: nil, spotsLeft: "6,227 Left", totalSpots: "6,263", firstPrize: "₹60,000", winnerPercentage: "65%"),
            ContestData(title: "₹3 Lakhs", price: "₹999", discountedPrice: nil, spotsLeft: "All Spots Filled", totalSpots: nil, firstPrize: nil, winnerPercentage: nil),
            
            ContestData(title: "₹3 Lakhs", price: "₹999", discountedPrice: nil, spotsLeft: "All Spots Filled", totalSpots: nil, firstPrize: nil, winnerPercentage: nil)

        ]
    }
}




#Preview {
    ContestsScreen()
}


