//
//  TeamSelectionScreen.swift
//  Pro11
//
//  Created by Ravi Ranjan on 28/12/24.
//

import SwiftUI

struct TeamSelectionScreen: View {
    @StateObject var viewmodel: TeamSelectionViewModel = TeamSelectionViewModel()
    
    var body: some View {
        VStack {
            CreateTeamHeaderView()
            // Scrollable Tabs Section
            ScrollableTabSwitcher(
                tabs: [
                    TabItem(
                        title: "WK",
                        view: AnyView(PlayerView(playerData: viewmodel.players?.wktBatter ?? [])
                            .padding(.top))
                    ),
                    TabItem(
                        title: "BAT",
                        view: AnyView(PlayerView(playerData: viewmodel.players?.batter ?? [])
                            .padding(.top))
                        
                    ),
                    TabItem(
                        title: "AR",
                        view: AnyView(PlayerView(playerData: viewmodel.players?.allRounder ?? [])
                            .padding(.top))
                    ),
                    TabItem(
                        title: "BOW",
                        view: AnyView(PlayerView(playerData: viewmodel.players?.bowler ?? [])
                            .padding(.top))
                    )
                    
                ],
                selectedColor: .red
            )
        }
        
        .navigationBarBackButtonHidden(true)
        .onAppear() {
            viewmodel.getPlayerByContestId(contestId: "91814")
        }
    }
}

#Preview {
    TeamSelectionScreen()
}
