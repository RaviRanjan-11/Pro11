//
//  PlayerView.swift
//  Pro11
//
//  Created by Ravi Ranjan on 28/12/24.
//

import SwiftUI

struct PlayerView: View {
    
    var playerData: [PlayerModelProperty]
    
    var body: some View {
        VStack {
            // Header Buttons
            HStack {
                Button {
                    // Action for SELECTED BY button
                } label: {
                    Text("SELECTED BY")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                }
                Spacer()
                Button {
                    // Action for POINTS button
                } label: {
                    Text("POINTS")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                }
                .padding(.leading, 50)
                Spacer()
                Button {
                    // Action for CREDITS button
                } label: {
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
            
            // Scrollable List of Player Cards
            ScrollView(showsIndicators: false) {
                ForEach(playerData, id: \.id) { player in
                    PlayerCard(playerStatus: .notPlaying, onPlusButtonTap: {}, playerData: player)
                }
            }
        }
    }
}

#Preview {
    PlayerView(playerData: [mockPlayerData])
}
