//
//  MyTeamScreen.swift
//  Pro11
//
//  Created by Ravi Ranjan on 18/01/25.
//

import SwiftUI

struct MyTeamScreen: View {
    @Environment(\.presentationMode) var presentationManager
    @StateObject private var viewModel: MyTeamViewModel

    @State private var navigateToCreateTeam = false
    var contestData: ContestModelData?
    var contestHeaderData: ContestHeaderData?

    // Initialize with the passed team list
    init(teamList: [TeamResponse], contestData: ContestModelData?, contestHeaderData: ContestHeaderData?) {
        _viewModel = StateObject(wrappedValue: MyTeamViewModel(teamList: teamList, contestID: contestData?.matchID ?? 0))
        self.contestData = contestData
        self.contestHeaderData = contestHeaderData
    }

    var body: some View {
        VStack {
            JoinContestNavigationBar(contestHeaderData: contestHeaderData) {
                presentationManager.wrappedValue.dismiss()
            }

            if viewModel.isLoading {
                ProgressView("Loading...")
                    .padding()
            } else if let errorMessage = viewModel.errorMessage {
                Spacer()

                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
                Spacer()

            } else {
                ScrollView(showsIndicators: false) {
                    LazyVStack {
                        ForEach($viewModel.teamList) { $team in
                            MyTeamCard(team: $team)
                                .padding(.bottom)
                        }
                    }
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 20)

                Spacer()

                HStack {
                    RoundButton(
                        title: "Create New Team",
                        backgroundColor: ColorPallate.darkGreenGroundColor,
                        foregroundColor: .white,
                        strokeColor: .clear
                    ) {
                        navigateToCreateTeam.toggle()
                    }

                    if let selectedTeam = viewModel.teamList.first(where: { $0.issSelected }) {
                        RoundButton(
                            title: "Join",
                            backgroundColor: ColorPallate.gradientRedLeft,
                            foregroundColor: .white,
                            strokeColor: .clear
                        ) {
                            if let contestID = contestData?.seriesID {
                                viewModel.joinContestWithTeam(selectedTeam, contestID: contestID)
                            }
                        }
                        .padding(.horizontal, 10)
                    }
                }
                .padding(.horizontal, 10)
            }
        }
        .background(
            NavigationLink(
                destination: TeamSelectionScreen(
                    contestID: contestData?.matchID,
                    matchID: contestData?.seriesID
                ).navigationBarBackButtonHidden(true),
                isActive: $navigateToCreateTeam
            ) {
                EmptyView()
            }
        )
        .navigationBarBackButtonHidden(true)
    }
}


#Preview {
    MyTeamScreen(teamList: [], contestData: nil, contestHeaderData: nil)
}


struct MyTeamCard:View {
    
    @Binding var team: TeamResponse
    var body: some View {
        ZStack {
            Image("ground-texture")
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack {
                
                HStack {
                    Text(team.teamName)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.leading, 15)
                    Spacer()
                    HStack (spacing: 30){
                        ImageButton(image: "draw",height: .small,width: .small){
                            
                        }
                        
                        ImageButton(image: "view",height: .small,width: .small){
                            
                        }
                        CheckBox(isChecked: $team.issSelected, callback: { value in
                            team.issSelected = value
                        })
                    }
                    .padding(.horizontal, 10)
                }
                .padding()
                .background(Color.black.opacity(0.3))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Spacer()
                HStack {
                    
                    VStack {
                        Text(team.team1Name.uppercased())
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text(team.team1PlayerCount.toString)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .foregroundStyle(.primary)
                    }
                    .padding(.horizontal, 10)
                    VStack {
                        
                        Text(team.team2Name.uppercased())
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Text(team.team2PlayerCount.toString)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .foregroundStyle(.primary)
                    }
                    Spacer()
                    HStack(spacing: 16) {
                        PlayerImageProvider(playerName: team.captain.name,role: "C")
                        PlayerImageProvider(playerName: team.viceCaptain.name, role: "VC")
                    }
                    
                }
                Spacer()
                HStack {
                    Text("Bat(\(team.batterCount))")
                        .fontWeight(.bold)
                    Spacer()
                    Text("Wk (\(team.wkCount))")
                        .fontWeight(.bold)
                    
                    Spacer()
                    Text("Bowl (\(team.bowlerCount))")
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Text("All(\(team.allRounder))")
                        .fontWeight(.bold)
                    
                    
                }
                .font(.caption)
                .padding(.horizontal)
                .padding(.bottom, 10)
                .padding(.top, 10)
                .foregroundColor(.white)
                .background(
                    RoundedRectangle(cornerRadius: 0)
                        .fill(Color.black.opacity(0.2))
                )
            }
            
        }
        .frame(height: 200)
    }
}





struct PlayerImageProvider:View{
    
    var playerName:String = "A Cary"
    var role: String = "VC"
    var body: some View{
        ZStack {
            Image("cricketer")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
            VStack {
                Text(role)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 5)
                    .padding(.vertical, 5)
                    .background(Color.white)
                    .clipShape(Circle())
                    .offset(x: -25, y: -15)
                
                Text(playerName)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 10)
                    .background(LRGradientView())
                    .offset(x: 0, y: 17)
                    .foregroundColor(.white)
            }
            .padding(.horizontal,5)
        }
    }
}


#Preview {
    MyTeamCard(team: .constant( TeamResponse(teamID: 32, teamName: "MYPro11Circle", batterCount: 4, team1PlayerCount: 5, team2PlayerCount: 4, team1Name: "IND", team2Name: "AUS", bowlerCount: 5, wkCount: 2, allRounder: 3, captain: TeamResponseCaptainViceCaptain(id: 4, name: "N ANDHS", role: "WK", doB: "23434234", teamID: 4234, battingStyle: "BOW", bowlingStyle: nil, captain: nil, creditScore: 423, image: 4234, playerID: 42234, seriesID: 4335423, squadID: 32423), viceCaptain: TeamResponseCaptainViceCaptain(id: 4, name: "N ANDHS", role: "WK", doB: "23434234", teamID: 4234, battingStyle: "BOW", bowlingStyle: nil, captain: nil, creditScore: 423, image: 4234, playerID: 42234, seriesID: 4335423, squadID: 32423), totalPoints: 423)))
}
