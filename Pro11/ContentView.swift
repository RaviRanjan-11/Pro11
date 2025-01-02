//
//  ContentView.swift
//  Pro11
//
//  Created by Ravi Ranjan on 21/12/24.
//

import SwiftUI
import IQKeyboardManagerSwift

struct ContentView: View {
    
    init() {
        IQKeyboardManager.shared.isEnabled = true
    }
    var body: some View {
        NavigationView {
            SplashScreen()
                .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    ContentView()
}
