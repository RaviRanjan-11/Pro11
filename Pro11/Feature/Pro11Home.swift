//
//  Pro11Home.swift
//  Pro11
//
//  Created by Ravi Ranjan on 21/12/24.
//

import SwiftUI

struct Pro11Home: View {
    var body: some View {
        VStack(spacing: 0) {
//            NavigationBar(title: "Home")
            FantasyHomeScreen()
//            Spacer()
        }
    }
}

#Preview {
    Pro11Home()
}

struct BannerView: View {
    let banners: [String]

    var body: some View {
        TabView {
            ForEach(banners, id: \.self) { banner in
               
            }
            
        }
        .tabViewStyle(PageTabViewStyle())
    }
}
