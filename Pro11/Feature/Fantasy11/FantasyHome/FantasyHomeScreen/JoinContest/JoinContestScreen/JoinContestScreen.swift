//
//  JoinContestScreen.swift
//  Pro11
//
//  Created by Ravi Ranjan on 27/12/24.
//

import SwiftUI

enum ContestScreenTab {
    case winning
    case leaderboard
}
struct JoinContestScreen: View {
    
    @State private var navigateToAllUpcomingMatches = false
    @State private var spotsLeft = 5369
    @State private var prizeAmount = "₹6 Lakhs"
    @State private var contestTime = "19h 09m left"
    @State private var prize = "₹55,000"
    
    @State private var selectedTab : ContestScreenTab = .leaderboard
    
    @Environment(\.presentationMode) var presentationManager
    var body: some View {
        VStack {
            
            JoinContestNavigationBar(contestTime: "15:40:23 hours left") {
                presentationManager.wrappedValue.dismiss()
            }
            JoinContestCard() {
                print("Join contest callback")
            }
            
            JoinContestOfferView()

           
            
            TabSwitcherView { selectedtab in
                selectedTab = selectedtab
            }
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
    }
    
}

#Preview {
    JoinContestScreen()
}



struct IconImageWithTitleAndValue:View {
    var imageName: String = "first"
    var title: String = ""
    var value: String = ""
    
    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .frame(width: 20, height: 20)
            Text("\(title):")
                .font(.caption)
                .fontWeight(.bold)
            Text(value)
                .font(.caption)
                .fontWeight(.bold)
            
        }
    }
}


#Preview(body: {
    IconImageWithTitleAndValue()
})
