//
//  TeamSelectionScreen.swift
//  Pro11
//
//  Created by Ravi Ranjan on 28/12/24.
//

import SwiftUI

struct TeamSelectionScreen: View {
    
    @StateObject var viewmodel: TeamSelectionViewModel = TeamSelectionViewModel()
    
    var contestID: Int?
    var matchID: Int?
    
    var body: some View {
        VStack {
            CreateTeamHeaderView(selectedPlayers: $viewmodel.selectedPlayers, totalCredit: $viewmodel.totalCredit)

            // Scrollable Tabs Section
            ScrollableTabSwitcher(
                tabs: [
                    TabItem(
                        title: "WK",
                        view: AnyView(PlayerView(viewModel: viewmodel, playerData: viewmodel.players?.wktBatter ?? []).padding(.top))
                    ),
                    TabItem(
                        title: "BAT",
                        view: AnyView(PlayerView(viewModel: viewmodel, playerData: viewmodel.players?.batter ?? []).padding(.top))
                    ),
                    TabItem(
                        title: "AR",
                        view: AnyView(PlayerView(viewModel: viewmodel, playerData: viewmodel.players?.allRounder ?? []).padding(.top))
                    ),
                    TabItem(
                        title: "BOW",
                        view: AnyView(PlayerView(viewModel: viewmodel, playerData: viewmodel.players?.bowler ?? []).padding(.top))
                    )
                ],
                selectedColor: .red
            )
            TeamSeletionMoverView {
                viewmodel.movetoSelectCaptainViceCaptain()
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            viewmodel.getPlayerByContestId(contestId: contestID?.toString ?? "0")
        }
        .background(
            NavigationLink(destination: CaptainSelectionScreen(viewModel: CaptainSelectionViewModel(selectedPlayers: viewmodel.selectedPlayers, contestID: contestID, matchID: matchID))
                .navigationBarBackButtonHidden(true), isActive: $viewmodel.navigateToCaptainSelection) {
                    EmptyView()
                }
        )
    }
}


#Preview {
    TeamSelectionScreen()
}
