//
//  CaptainSelectionScreen.swift
//  Pro11
//
//  Created by Ravi Ranjan on 04/01/25.
//

import SwiftUI
struct CaptainSelectionScreen: View {
    
    @StateObject var viewModel: CaptainSelectionViewModel
    @State var navigateToMyTeam: Bool = false
    @Environment(\.presentationMode) var presentationManager
    
    var body: some View {
        NavigationView {
            VStack {
                // Header View with dismiss action
                CaptainSelectionHeaderView(captain: viewModel.captain, viceCaptain: viewModel.viceCaptain) {
                    presentationManager.wrappedValue.dismiss()
                }
                .padding(.bottom)
                
                // List of Players
                ScrollView(showsIndicators: false) {
                    LazyVStack {
                        ForEach(viewModel.selectedPlayers, id: \.id) { player in
                            PlayerCardForCaptainViceCaptain(
                                player: player,
                                isCaptain: viewModel.captain?.id == player.id,
                                isViceCaptain: viewModel.viceCaptain?.id == player.id,
                                onSelectCaptain: { viewModel.setCaptain(player: player) },
                                onSelectViceCaptain: { viewModel.setViceCaptain(player: player) }
                            )
                        }
                    }
                }
                
                // Save Button
                TeamSeletionMoverView(titleForNext: "SAVE") {
                    viewModel.createUserTeam()
                }
                
                Spacer()
                
                // Navigation Link to "My Team" Screen
                NavigationLink(
                    destination: MyTeamScreen(teamList: viewModel.teamList ?? []),
                    isActive: $viewModel.navigateToMyTeam
                ) {
                    EmptyView()
                }
            }
           
        }
    }
}






struct CaptainSelectionHeaderView: View {
    
    var captain: PlayerModelProperty?
    var viceCaptain: PlayerModelProperty?
    var backBttontAction: () -> Void
    var body: some View {
        
        VStack {
            HStack {
                Button(action: {
                    backBttontAction()
                    
                }) {
                    Image("left-arrow")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .font(.title)
                        .foregroundColor(.white)
                    
                    
                }
                .padding(.trailing, 20)
                VStack(alignment:.leading) {
                    
                    Text("Select Captain & Vice Captain")
                        .font(.headline)
                        .fontWeight(.bold)
                    Text("18h:30:00 left")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }
                .foregroundColor(.white)
                Spacer()
                ImageButton(image: "questionmark.circle.fill",isSystemImage: true, tintcolor: .white,height: .small, width: .small) {
                }
            }
            .padding()
            
            HStack {
                HStack(spacing: 15){
                    Image("cricketer")
                        .resizable()
                        .frame(width: 60,height: 60)
//                    Spacer()
                    VStack(alignment:.leading){
                        Text("Captain")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Text(captain?.playerName ?? "Captain")
                            .font(.caption)
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .lineLimit(1)
                        Text("2x Points")
                            .font(.caption)
                            .foregroundColor(.white)
                            .foregroundColor(.white)


                    }
                    
                }
                .frame(width: UIScreen.main.bounds.width / 2 - 30)
                Spacer()
                Image("lighting")
                    .resizable()
                    .frame(width: 20, height: 40)
                Spacer()
                HStack(spacing: 15){
                    Image("cricketer")
                        .resizable()
                        .frame(width: 50,height: 50)

                    VStack(alignment:.leading){
                        Text("Vice Captain")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Text(viceCaptain?.playerName ?? "Vice-Captain")
                            .font(.caption)
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .lineLimit(1)
                        Text("1.5x Points")
                            .font(.caption)
                            .foregroundColor(.white)
                            .foregroundColor(.white)

                    }
                    
                }
                .frame(width: UIScreen.main.bounds.width / 2 - 30)
                .padding(.horizontal, 15)

                
            }
            .padding(.vertical, 10)
            
        }
        .background(LRDGradientView())
    }
}


struct PlayerCardForCaptainViceCaptain: View {
    var player: PlayerModelProperty
    var isCaptain: Bool
    var isViceCaptain: Bool
    var onSelectCaptain: () -> Void
    var onSelectViceCaptain: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                Image("cricketer")
                    .resizable()
                    .frame(width: 50, height: 50)
                
                VStack(alignment: .leading) {
                    Text(player.playerName)
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .lineLimit(1)
                    Text("Points: 321")
                        .font(.caption)
                        .fontWeight(.bold)
                }
                
                Spacer()
                
                Button(action: onSelectCaptain) {
                    VStack {
                        Text("C")
                            .font(.caption)
                            .fontWeight(isCaptain ? .semibold : .bold)
                            .frame(width: 22, height: 22)
                            .foregroundColor(.white)
                            .padding()
                        
                            .background(Circle().fill(isCaptain ? .red : .gray))
                        Text("1.9%")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    
                }
                
                Button(action: onSelectViceCaptain) {
                    VStack {
                        Text("VC")
                            .font(.caption)
                            .fontWeight(isViceCaptain ? .semibold : .bold)
                            .frame(width: 22, height: 22)
                            .foregroundColor(.white)
                            .padding()
                            .background(Circle().fill(isViceCaptain ? .blue : .gray))
                        Text("1.9%")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal, 10)
                }
            }
            Divider()
        }
        .padding(.horizontal)
    }
}

#if DEBUG

#Preview {
    CaptainSelectionHeaderView(backBttontAction: {})
}
#Preview {
    CaptainSelectionScreen(viewModel: CaptainSelectionViewModel(selectedPlayers: [mockPlayerData, mockPlayerData]))
}
#Preview {
    PlayerCardForCaptainViceCaptain(player: mockPlayerData, isCaptain: false, isViceCaptain: false, onSelectCaptain: {}, onSelectViceCaptain: {}
    )
}


#endif
