//
//  JoinContestScreen.swift
//  Pro11
//
//  Created by Ravi Ranjan on 27/12/24.
//

import SwiftUI

struct JoinContestScreen: View {
    @State private var navigateToAllUpcomingMatches = false
    @State private var spotsLeft = 5369
    @State private var prizeAmount = "₹6 Lakhs"
    @State private var contestTime = "19h 09m left"
    @State private var prize = "₹55,000"
    @State private var naviagteToCreateTeam = false

    @Environment(\.presentationMode) var presentationManager

    var body: some View {
        ZStack {
            
            VStack {
                JoinContestNavigationBar(contestTime: contestTime) {
                    presentationManager.wrappedValue.dismiss()
                }
                // Contest Card
                JoinContestCard {
                    print("Join contest callback")
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
            .background(
                NavigationLink(destination: TeamCreationScreen()
                    .navigationBarBackButtonHidden(true), isActive: $naviagteToCreateTeam) {
                        EmptyView()
                    }
            )
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    JoinContestScreen()
}

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
