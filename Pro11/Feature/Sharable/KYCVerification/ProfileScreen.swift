//
//  ProfileScreen.swift
//  Pro11
//
//  Created by Ravi Ranjan on 21/12/24.
//


import SwiftUI

struct ProfileScreen: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationBar(title: "Profile")
                
                List {
                    // KYC Verification
                    NavigationLink(destination:
                                    KYCVerificationScreen()) {
                        SettingRow(title: "KYC Verification", icon: "checkmark.circle.fill")
                    }

                    // Refer and Earn
                    NavigationLink(destination: ReferAndEarnScreen()) {
                        SettingRow(title: "Refer and Earn", icon: "star.fill")
                    }

                    // Balance
                    NavigationLink(destination: BalanceScreen(isPresentedFromTabBar: false)
                        .navigationBarBackButtonHidden()) {
                        SettingRow(title: "Balance", icon: "creditcard.fill")
                    }

                    // How to Play
                    NavigationLink(destination: Text("How to Play")) {
                        SettingRow(title: "How to Play", icon: "gamecontroller.fill")
                    }

                    // Transaction
                    NavigationLink(destination: TransactionScreen()) {
                        SettingRow(title: "Transaction", icon: "arrow.right.circle.fill")
                    }

                    // Help & Support
                    NavigationLink(destination:
                                    HelpAndSupport()){
                        SettingRow(title: "Help & Support", icon: "questionmark.circle.fill")
                    }

                    // Terms and Conditions
                    NavigationLink(destination: TermsAndCondtionScreen()) {
                        SettingRow(title: "Terms and Conditions", icon: "doc.text.fill")
                            .foregroundColor(.primary) // Ensure it's not faded
                    }

                    // Logout
                    Button(action: {
                        // Add your logout functionality here
                    }) {
                        SettingRow(title: "Logout", icon: "arrow.right.circle.fill")
                            .foregroundColor(.red) // Logout in red
                    }
                }
            }
        }
    }
}

struct SettingRow: View {
    var title: String
    var icon: String

    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.red)
            Text(title)
                .font(.system(size: 16))
                .foregroundColor(.primary) // Ensure the text color is vibrant
            Spacer()
        }
        .padding()
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}
