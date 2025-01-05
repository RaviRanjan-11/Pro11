//
//  FantasyHomeScreen.swift
//  Pro11
//
//  Created by Ravi Ranjan on 21/12/24.
//

import SwiftUI
import Lottie

let matchData = [
    (team1: "BH", team2: "AS", time: "Tomorrow 1:45 PM", prize: "₹5 Lakhs"),
    (team1: "MR", team2: "PS", time: "Mon 1:45 PM", prize: "₹7 Lakhs"),
    (team1: "IND-W", team2: "WI-W", time: "Tomorrow 1:30 PM", prize: "Popular Match"),
    (team1: "SRH", team2: "KKR", time: "Wed 7:30 PM", prize: "₹10 Lakhs")
]
struct FantasyHomeScreen: View {
    @State private var selectedTab: String = "Cricket"
    let tabs = ["Cricket", "Football", "Tennis"]
    
    @State var navigateToContest: Bool = false
    @State var navigateToAllUpcomingMathces: Bool = false
    
    @StateObject var viewmodel: FantasyHomeScreenViewModel = FantasyHomeScreenViewModel()
    @State var selecetdMatch: Int?
    
    var body: some View {
        VStack(spacing: 10) {
            FantasyHomeHeaderView()
            
            ScrollView(showsIndicators: false) {
                
                HStack {
                    Text("My Matches")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(10)
                    Spacer()
                    TextButton {
                        // Handle button action
                        navigateToContest = true
                    }
                    .padding(10)
                }
                
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    LRGradientView()
                )
                
                // Horizontal Match List
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(matchData.indices, id: \.self) { index in
                            MatchCardView(
                                teamName1: matchData[index].team1 ,
                                teamName2: matchData[index].team2,
                                teamNameS1: matchData[index].team1,
                                teamNameS2: matchData[index].team2,
                                time: "Wed 7:30 PM",
                                prize: "₹10 Lakhs",
                                seriesName: "",
                                forUpcomingMatch: false
                                
                            )
                            .frame(width: UIScreen.main.bounds.width * 0.9)
                            .padding(.horizontal, 5)
                            .onTapGesture {
                                navigateToContest.toggle()
                                
                            }
                        }
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 10)
                }
                
                HStack {
                    Text("Upcoming Matches")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(10)
                    Spacer()
                    TextButton {
                        // Handle button action
                        navigateToAllUpcomingMathces.toggle()
                    }
                    .padding(10)
                }
                .background(
                    LRGradientView()
                )
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.red)
               
                NavigationLink(
                    destination: AllMatchesScreen().navigationBarBackButtonHidden(),
                    isActive: $navigateToAllUpcomingMathces) {
                    EmptyView()
                }
                LazyVStack(spacing: 10) {
                    if let matches = viewmodel.upcomingMatches?.data, !matches.isEmpty {
                        ForEach(matches, id: \.id) { match in
                            createMatchCardView(for: match.matchID)
                                .onTapGesture {
                                    if let matchID = match.matchID?.id {
                                        selecetdMatch = matchID
                                        navigateToContest = true
                                    }
                                }
                        }
                    } else {
                        VStack {
                            Spacer()
                            NoMatchView()
                            Spacer()
                        }
                    }
                }
                .padding()
                .background(
                    Group {
                        if let selectedMatch = selecetdMatch {
                            NavigationLink(
                                destination: ContestsScreen(
                                    viewmodel: ContestViewModel(
                                        contestHeaderData: viewmodel.getContestHeaderDataForContest(from: selectedMatch)
                                    )
                                )
                                .navigationBarBackButtonHidden(true),
                                isActive: $navigateToContest
                            ) {
                                EmptyView()
                            }
                        }
                    }
                )
            }
        }
        .background(Color.gray.opacity(0.1))
        .onAppear {
            viewmodel.getUpcomingMatches()
        }
    }
}

//     Helper method to create the match card
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
                seriesName: match.seriesName
                
            )
            .frame(width: UIScreen.main.bounds.width * 0.9)
        } else {
            NoMatchView()
        }
    }
    
}


#if DEBUG
#Preview {
    FantasyHomeScreen()
}
#endif

