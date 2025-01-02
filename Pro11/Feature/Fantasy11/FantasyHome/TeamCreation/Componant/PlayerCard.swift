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
    
    var isPlaying: PlayerSelected = .playing
    @State private var navigateToPlayerInfoScreen: Bool = false
    
    var body: some View {
        
        VStack {
            
            HStack {
                ZStack {
                    Image("cricketer")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                    VStack {
                        ImageButton(image: "questionmark.circle.fill",isSystemImage: true, tintcolor: .gray,height: .small, width: .small) {
                            navigateToPlayerInfoScreen.toggle()
                        }
                        .offset(x:-40, y:-15)
                        Text("IND")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .padding(.horizontal,10)
                            .background(LRGradientView())
                            .offset(x:-30, y:20)
                            .foregroundColor(.white)
                        
                        
                    }
                    
                }
                VStack(alignment: .leading) {
                    Text("S SMITH")
                        .font(.callout)
                        .fontWeight(.bold)
                    Text("Sel by 0.16%")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text(isPlaying.status)
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(isPlaying.color)
                }
                Spacer()
                Text("0")
                    .font(.callout)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                Spacer()
                Text("9.3")
                    .font(.callout)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                    .padding(.trailing,5)
                ImageButton(image: "plus.app", isSystemImage: true,tintcolor: .green, height: .medium, width: .medium) {
                    
                }
                
            }
            
        }
        .padding(.horizontal)
        
        Divider()
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
    PlayerCard()
}
