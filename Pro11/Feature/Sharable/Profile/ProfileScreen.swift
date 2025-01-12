//
//  ProfileScreen.swift
//  Pro11
//
//  Created by Ravi Ranjan on 21/12/24.
//


import SwiftUI

struct ProfileScreen: View {
    @StateObject private var viewModel = ProfileViewModel()
    @State private var isLoggingOut = false
    @State private var navigateToLogin = false

    var body: some View {
            VStack {
                NavigationBar(title: "Profile")
                
                
                
                List {
                    
                    NavigationLink(destination: BalanceScreen(isPresentedFromTabBar: false).navigationBarBackButtonHidden()) {
                        SettingRow(title: "Balance", icon: "creditcard.fill")
                    }
                    
                    NavigationLink(destination: TransactionScreen()) {
                        SettingRow(title: "Transaction", icon: "arrow.right.circle.fill")
                    }
                    
                    NavigationLink(destination: ReferAndEarnScreen()) {
                        SettingRow(title: "Refer and Earn", icon: "star.fill")
                    }
                   
                    NavigationLink(destination: Text("How to Play")) {
                        SettingRow(title: "How to Play", icon: "gamecontroller.fill")
                    }
                    
                    NavigationLink(destination: KYCVerificationScreen()) {
                        SettingRow(title: "KYC Verification", icon: "checkmark.circle.fill")
                    }
                    NavigationLink(destination: HelpAndSupport()) {
                        SettingRow(title: "Help & Support", icon: "questionmark.circle.fill")
                    }
                    NavigationLink(destination: TermsAndCondtionScreen()) {
                        SettingRow(title: "Terms and Conditions", icon: "doc.text.fill")
                    }
                    Button(action: {
                        isLoggingOut = true
                        viewModel.logout()
                    }) {
                        SettingRow(title: "Logout", icon: "arrow.right.circle.fill")
                            .foregroundColor(.red)
                    }
                }
                .listStyle(InsetGroupedListStyle())

                NavigationLink(destination: LoginScreen().navigationBarBackButtonHidden(true), isActive: $navigateToLogin) {
                    EmptyView()
                }
            }
            .onReceive(viewModel.logoutPublisher) { success in
                isLoggingOut = false
                navigateToLogin = success
            }
            .overlay(
                Group {
                    if isLoggingOut {
                        ProgressView("Logging out...")
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                }
            )
        }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}
