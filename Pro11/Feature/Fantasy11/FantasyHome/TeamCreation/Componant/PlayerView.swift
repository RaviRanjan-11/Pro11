//
//  PlayerView.swift
//  Pro11
//
//  Created by Ravi Ranjan on 28/12/24.
//

import SwiftUI

struct PlayerView: View {
    @StateObject var viewModel: TeamSelectionViewModel
    var playerData: [PlayerModelProperty]
    
    var body: some View {
        VStack {
            HStack {
                Button { } label: {
                    Text("SELECTED BY")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                }
                Spacer()
                Button { } label: {
                    Text("POINTS")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                }
                .padding(.leading, 50)
                Spacer()
                Button { } label: {
                    Text("CREDITS")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                }
            }
            .padding(.horizontal)
            .padding(.bottom)
            
            Divider()
            
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEach(playerData, id: \.playerID) { player in
                        PlayerCard(
                            playerStatus: .notPlaying,
                            viewModel: viewModel,
                            playerData: player
                        )
                        .id(player.playerID)
                    }
                }
            }
        }
    }
}

#if DEBUG
#Preview {
    PlayerView(viewModel: TeamSelectionViewModel(), playerData: [mockPlayerData])
}
#endif
