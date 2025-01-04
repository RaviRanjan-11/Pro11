//
//  AllMatchesScreen.swift
//  Pro11
//
//  Created by Ravi Ranjan on 25/12/24.
//

import SwiftUI
struct AllMatchesScreen: View {
    
    @StateObject var viewmodel: AllMatchesViewModel = AllMatchesViewModel()
    @State var navigateToContest: Bool = false
    @Environment(\.presentationMode) var presentationManager

    var body: some View {
            ZStack {
                VStack {
                    NavigationBarBack(title:"All Upcoming Matches") {
                        presentationManager.wrappedValue.dismiss()
                    }
                    ScrollView{
                        // Upcoming Matches List
                        LazyVStack(spacing: 10) {
                            if let matches = viewmodel.upcomingMatches?.data, !matches.isEmpty {
                                ForEach(matches, id: \.id) { match in
                                    NavigationLink(
                                        destination: ContestsScreen(viewmodel: ContestViewModel(contestHeaderData:nil))
                                            .navigationBarBackButtonHidden(true),
                                        isActive: $navigateToContest
                                    ) {
                                        createMatchCardView(for: match.matchID)
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                }
                            } else {
                                Text("No upcoming matches.")
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding()
                    }
                }
                .onAppear {
                    viewmodel.getUpcomingMatches()
                }
            }        
    }

    func createMatchCardView(for match: MatchID?) -> some View {
        Group {
            if let match = match {
                MatchCardView(
                    teamName1: match.team1?.teamName ?? "",
                    teamName2: match.team2?.teamName ?? "",
                    teamNameS1: match.team1?.teamSName ?? "",
                    teamNameS2: match.team2?.teamSName ?? "",
                    time: "Wed 7:30 PM",
                    prize: "₹10 Lakhs",
                    seriesName: match.seriesName ?? ""
                )
                .frame(width: UIScreen.main.bounds.width * 0.9)
            } else {
                NoMatchView()
            }
        }
    }
}

#Preview {
    AllMatchesScreen()
}
