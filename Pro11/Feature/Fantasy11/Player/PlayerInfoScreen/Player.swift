//
//  Player.swift
//  Pro11
//
//  Created by Ravi Ranjan on 23/12/24.
//

import SwiftUI

struct Player: View {
    private var width: CGFloat
    private var height: CGFloat
    private var playerImage: String

    init(width: CGFloat = 150, height: CGFloat = 150, playerImage: String = "cricketer") {
        self.width = width
        self.height = height
        self.playerImage = playerImage
    }

    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .fill(Color.red)
                    .frame(width: width + 10, height: height + 10)
                Image(playerImage)
                    .resizable()
                    .frame(width: width, height: height)
                Text("IND")
                    .fontWeight(.bold)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .foregroundColor(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.red)
                    )
                    .offset(y: height / 2)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    Player(width: 150, height: 150, playerImage: "cricketer")
}
