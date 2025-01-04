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
    var onPlusButtonTap: () -> Void
    var isSelected: Bool = true
    
    @State private var navigateToPlayerInfoScreen: Bool = false
    var playerData: PlayerModelProperty
    
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
                ImageButton(image: "plus.app", isSystemImage: true, tintcolor: .green, height: .medium, width: .medium) {
                    onPlusButtonTap()
                }
                
                
            }
            
            Divider()
            
        }
        .padding(.horizontal)
        .background(isSelected ? Color.blue.opacity(0.1) : Color.white)
        
//        Divider()
        NavigationLink(
            destination: PlayerInfoScreen()
                .navigationBarBackButtonHidden(true),
            isActive: $navigateToPlayerInfoScreen
        ) {
            EmptyView()
        }
        
    }
}

#Preview {
    PlayerCard(playerStatus: .notPlaying, onPlusButtonTap: {}, playerData: mockPlayerData
    )
}
