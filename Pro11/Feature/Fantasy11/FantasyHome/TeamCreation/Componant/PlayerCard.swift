//
//  PlayerCard.swift
//  Pro11
//
//  Created by Ravi Ranjan on 28/12/24.
//

import SwiftUI

enum PlayerSelected: CaseIterable {
    case playing
    case unavailable
    case notPlaying
    
    var color: Color {
        switch self {
        case .playing: return .green
        case .unavailable: return .red
        case .notPlaying: return .gray
        }
    }
    var status: String {
        switch self {
        case .playing: return "Playing"
        case .unavailable: return "Unavailable"
        case .notPlaying: return "Not Playing"
        }
    }
}

struct PlayerCard: View {
    var playerStatus: PlayerSelected
    @ObservedObject var viewModel: TeamSelectionViewModel
    var playerData: PlayerModelProperty

    var isSelected: Bool {
        viewModel.selectedPlayers.contains { $0.id == playerData.id }
    }

    @State private var navigateToPlayerInfoScreen: Bool = false

    var body: some View {
        VStack {
            HStack {
                ZStack {
                    Image("cricketer")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 70)
                    VStack {
                        ImageButton(image: "questionmark.circle.fill", isSystemImage: true, tintcolor: .gray, height: .small, width: .small) {
                            navigateToPlayerInfoScreen.toggle()
                        }
                        .offset(x: -40, y: -15)
                        Text(playerData.teamSName)
                            .font(.caption)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 10)
                            .background(LRGradientView())
                            .offset(x: -30, y: 17)
                            .foregroundColor(.white)
                    }
                }
                
                VStack(alignment: .leading) {
                    Text(playerData.playerName)
                        .font(.subheadline)
                        .fontWeight(.bold)
                    Text("Sel by \(String(format: "%.2f"))%")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text(playerStatus.status)
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(playerStatus.color)
                }
                
                Spacer()
                
                Text(playerData.totalPoints.toString)
                    .font(.callout)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
                Spacer()
                
                Text("\(playerData.creditScore, specifier: "%.1f")")
                    .font(.callout)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                    .padding(.trailing, 5)
                
                ImageButton(
                    image: isSelected ? "checkmark.circle.fill" : "plus.app",
                    isSystemImage: true,
                    tintcolor: isSelected ? .green : ColorPallate.primary,
                    height: .medium,
                    width: .medium
                ) {
                    if isSelected {
                        viewModel.removePlayer(player: playerData)
                    } else {
                        viewModel.addPlayer(player: playerData)
                    }
                }
            }
            Divider()
        }
        .padding(.horizontal)
        .background(isSelected ? Color.green.opacity(0.2) : Color.white)
        .animation(.easeInOut, value: isSelected)
        
        NavigationLink(
            destination: PlayerInfoScreen()
                .navigationBarBackButtonHidden(true),
            isActive: $navigateToPlayerInfoScreen
        ) {
            EmptyView()
        }
    }
}


// SwiftUI Preview
#if DEBUG
#Preview {
    PlayerCard(
        playerStatus: .notPlaying,
        viewModel: TeamSelectionViewModel(),
        playerData: mockPlayerData
    )
}
#endif
