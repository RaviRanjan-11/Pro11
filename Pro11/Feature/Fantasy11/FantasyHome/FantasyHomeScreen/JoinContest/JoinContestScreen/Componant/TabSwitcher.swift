//
//  TabSwitcher.swift
//  Pro11
//
//  Created by Ravi Ranjan on 27/12/24.
//

import SwiftUI

struct TabSwitcherView: View {
    @State private var selectedTab: ContestScreenTab = .leaderboard
    var callback: (ContestScreenTab) -> Void

    var body: some View {
        VStack {
            // Tab Switcher
            HStack {
                // Winning Tab
                Button {
                    selectedTab = .winning
                    callback(selectedTab)
                } label: {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Winning")
                            .font(.headline)
                            .foregroundColor(selectedTab == .winning ? .red : .gray)
                        if selectedTab == .winning {
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color.red)
                                .frame(width: 70, height: 2)
                        }
                    }
                }

                Spacer()

                // Leaderboard Tab
                Button {
                    selectedTab = .leaderboard
                    callback(selectedTab)
                } label: {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Leaderboard")
                            .font(.headline)
                            .foregroundColor(selectedTab == .leaderboard ? .red : .gray)
                        if selectedTab == .leaderboard {
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color.red)
                                .frame(width: 100, height: 2)
                        }
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 10)
            .padding(.bottom, 10)
            .background(Color.gray.opacity(0.1))

            if selectedTab == .winning {
                Text("Winning Content")
                    .font(.title)
                    .foregroundColor(.black)
            } else if selectedTab == .leaderboard {
                LeaderBoard()
                
//                    .padding()
            }
        }
    }
}

#Preview {
    TabSwitcherView { selectedTab in
        print("Selected Tab: \(selectedTab)")
    }
}
