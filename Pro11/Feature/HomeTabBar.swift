//
//  HomeTabBar.swift
//  Pro11
//
//  Created by Ravi Ranjan on 21/12/24.
//

import SwiftUI

struct HomeTabBar: View {
    var body: some View {
        TabView {
            Text("Home View")
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }

            // Reward Tab
            Text("Reward View")
                .tabItem {
                    Image(systemName: "gift.fill")
                    Text("Reward")
                }

            // Portfolio Tab
            Text("Portfolio View")
                .tabItem {
                    Image(systemName: "briefcase.fill")
                    Text("Portfolio")
                }

            // Settings Tab
            Text("Settings View")
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
            
            Text("Profile")
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }

    
        }
    }
}

struct HomeTabBar_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabBar()
    }
}
