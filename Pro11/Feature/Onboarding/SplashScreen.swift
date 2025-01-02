//
//  SplashScreen.swift
//  Pro11
//
//  Created by Ravi Ranjan on 21/12/24.
//

import SwiftUI

struct SplashScreen: View {
    @State private var logoScale: CGFloat = 0
    @State private var logoOpacity: Double = 1
    @State private var textOpacity: Double = 1
    @State private var typedText: String = ""
    @State private var currentIndex = 0
    
    @State private var navigateToLogin = false
    @State private var navigatetoHome = false
    
    let fullText = "Encash your mastery"
    
    var body: some View {
        ZStack {
            Color.white // Background color
                .ignoresSafeArea()
            
            VStack {
                Image("pro11") // Replace with your image asset
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .scaleEffect(logoScale)
                    .opacity(logoOpacity)
                    .onAppear {
                        checkTokenAndAnimateLogo()
                    }
                
                Text(typedText)
                    .font(.headline)
                    .foregroundColor(.red)
                    .opacity(textOpacity)
                    .padding(.top, 20)
            }
            
            // Navigation to LoginScreen
            NavigationLink(destination: LoginScreen()
                .navigationBarBackButtonHidden(), isActive: $navigateToLogin) {
                EmptyView()
            }
            
            // Navigation to HomeScreen
            NavigationLink(destination: HomeTabBar()

                .navigationBarBackButtonHidden(), isActive: $navigatetoHome) {
                EmptyView()
            }
        }
        .navigationBarHidden(true) // Hide navigation bar on splash screen
    }
    
    private func checkTokenAndAnimateLogo() {
        // Simulate checking for a token
        let hasToken = UserStorage.token != "" // Replace with your token-check logic
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.easeOut(duration: 1.5)) {
                logoScale = 1.5
            }
        }
        
        // Proceed with animations
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            typeText()
        }
        
        // Set the appropriate navigation flag
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) { // Adjust timing as needed
            if hasToken {
                navigatetoHome = true
            } else {
                navigateToLogin = true
            }
        }
    }
    
    private func typeText() {
        if currentIndex < fullText.count {
            let nextIndex = fullText.index(fullText.startIndex, offsetBy: currentIndex)
            typedText += String(fullText[nextIndex])
            currentIndex += 1
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                typeText()
            }
        } else {
            fadeOutText()
        }
    }
    
    private func fadeOutText() {
        // Fade out text after typing is complete
        withAnimation(.easeInOut(duration: 1.0)) {
            textOpacity = 0
        }
    }
}

#Preview {
    SplashScreen()
}
