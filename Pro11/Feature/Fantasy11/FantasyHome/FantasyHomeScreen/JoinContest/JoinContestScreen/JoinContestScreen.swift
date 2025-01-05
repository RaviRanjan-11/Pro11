//
//  JoinContestScreen.swift
//  Pro11
//
//  Created by Ravi Ranjan on 27/12/24.
//

import SwiftUI

struct JoinContestScreen: View {
    @State private var navigateToAllUpcomingMatches = false
    @State private var naviagteToCreateTeam = false
    var contestData: ContestModelData?
    var contestHeaderData: ContestHeaderData?

    init(contestData: ContestModelData, contestHeaderData: ContestHeaderData) {
        self.contestData = contestData
        self.contestHeaderData = contestHeaderData
    }
    @Environment(\.presentationMode) var presentationManager

    var body: some View {
        ZStack {
            
            VStack {
                
                JoinContestNavigationBar(contestHeaderData: contestHeaderData, backButtonAction:  {
                    presentationManager.wrappedValue.dismiss()
                })
                // Contest Card
                
                if let contestData {
                    JoinContestCard(contestData: contestData){
                        naviagteToCreateTeam.toggle()
                    }
                    
                    // Offer Section
                    JoinContestOfferView()
                    
                    // Scrollable Tabs Section
                    ScrollableTabSwitcher(
                        tabs: [
                            TabItem(
                                title: "Winning",
                                view: AnyView(Text("Winning Content").font(.title).foregroundColor(.black))
                            ),
                            TabItem(
                                title: "Leaderboard",
                                view: AnyView(LeaderBoard().padding(.vertical))
                            )
                        ],
                        selectedColor:.red
                        
                    )
                    
                }
                    
            }
            .background(
                NavigationLink(destination: TeamSelectionScreen(contestID: contestData?.matchID)
                    .navigationBarBackButtonHidden(true), isActive: $naviagteToCreateTeam) {
                        EmptyView()
                    }
            )
            .navigationBarBackButtonHidden(true)
        }
    }
}

//#Preview {
//    JoinContestScreen(contestData: ContestModelData(id: 435, matchID: 534, seriesID: 675567, contestType: "sef", contestDescription: "fesfsd`", prizePool: 657675, status: "resr", joiningPrice: 345, isActive: false, winner: 4354, priceType: "Dssfsds", totalSpot: 765, filledSpot: 435, maxTeamJoinByUser: 45, firstPrice: 5435435), contestHeaderData: )
//}

struct IconImageWithTitleAndValue: View {
    var imageName: String = "first"
    var title: String = ""
    var value: String = ""
    var isSystem: Bool = true

    var body: some View {
        HStack {
            if isSystem {
                Image(systemName: imageName)
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            else {
                Image(imageName)
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            

            Text("\(title):")
                .font(.caption)
                .fontWeight(.bold)

            Text(value)
                .font(.caption)
                .fontWeight(.bold)
        }
    }
}

#Preview {
    IconImageWithTitleAndValue(
        imageName: "star.fill", 
        title: "Spots Left",
        value: "5369"
    )
}
