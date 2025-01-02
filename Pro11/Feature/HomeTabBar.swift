//
//  HomeTabBar.swift
//  Pro11
//
//  Created by Ravi Ranjan on 21/12/24.
//

import SwiftUI

struct HomeTabBar: View {
    
    
    
    init() {
        // Customize the tab bar appearance
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = .white
        
        tabBarAppearance.stackedLayoutAppearance.selected.iconColor = .red
        tabBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.red]
        
        tabBarAppearance.stackedLayoutAppearance.normal.iconColor = .gray
        tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.gray]
        
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    }
    
    var body: some View {
        TabView {
            Pro11Home()
                .navigationBarBackButtonHidden(true)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            MyContest()
                .navigationBarBackButtonHidden(true)
                .tabItem {
                    Image(systemName: "crown")
                        .resizable()
                    Text("My Contest")
                }


            ReferAndEarnScreen(isPresentedFromTabBar: true)
                .navigationBarBackButtonHidden(true)
                .tabItem {
                    Image(systemName: "gift.fill")
                    Text("Reward")
                }

            // Portfolio Tab
            BalanceScreen(isPresentedFromTabBar: true)
                .navigationBarBackButtonHidden(true)
                .tabItem {
                    Image(systemName: "briefcase.fill")
                    Text("Portfolio")
                }
            
            ProfileScreen()
                .navigationBarBackButtonHidden(true)
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
