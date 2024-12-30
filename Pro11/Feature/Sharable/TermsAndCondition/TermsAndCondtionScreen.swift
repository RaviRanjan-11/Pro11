//
//  TermsAndCondtionScreen.swift
//  Pro11
//
//  Created by Ravi Ranjan on 21/12/24.
//

import SwiftUI

struct TermsAndCondtionScreen: View {
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            // Navigation Bar with back button
            NavigationBarBack(title: "Terms & Conditions") {
                presentationMode.wrappedValue.dismiss()
            }
            
            // ScrollView for content
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    
                    // Heading
                    Text("Terms & Conditions")
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(.top, 20)
                    
                    // Section 1: General
                    SectionView(
                        title: "1. General",
                        content: """
                        Welcome to Pro11, an application owned and operated by Tantradhara Techsphere Pvt Ltd.
                        By accessing or using this application, you agree to be bound by these Terms & Conditions.
                        Please read them carefully before participating in any contests or predictions.
                        Failure to adhere to these terms may result in disqualification or suspension from the platform.
                        """
                    )
                    
                    // Section 2: Eligibility
                    SectionView(
                        title: "2. Eligibility",
                        content: """
                        Participation in Pro11 contests is open only to individuals who are 18 years or older.
                        You must ensure compliance with all local laws and regulations regarding fantasy gaming in your jurisdiction.
                        The app is not available in states or regions where fantasy gaming is prohibited by law.
                        """
                    )
                    
                    // Section 3: User Accounts
                    SectionView(
                        title: "3. User Accounts",
                        content: """
                        To participate in contests, users must register an account using valid information.
                        Only one account per individual is allowed. Multiple accounts or attempts to exploit the system
                        may lead to suspension or permanent bans. Users are responsible for maintaining the security of
                        their account credentials.
                        """
                    )
                    
                    // Section 4: Predictions and Scoring
                    SectionView(
                        title: "4. Predictions and Scoring",
                        content: """
                        Pro11 allows users to predict outcomes of sports events. Scoring is determined by
                        the accuracy of these predictions, as detailed in our scoring rules.
                        Predictions once submitted cannot be altered or canceled. The app does not allow
                        real-money betting or wagering.
                        """
                    )
                    
                    // Section 5: Rewards and Withdrawals
                    SectionView(
                        title: "5. Rewards and Withdrawals",
                        content: """
                        Users can earn rewards based on their performance in contests. Rewards may be
                        redeemable for cash or other prizes as specified on the platform. Withdrawals are subject
                        to verification and processing times. Any taxes or fees applicable are the user's
                        responsibility.
                        """
                    )
                    
                    // Add more sections as required...
                }
                .padding()
            }
        }
        .navigationBarHidden(true) // Hide default navigation bar to use custom one
    }
}


struct SectionView: View {
    var title: String
    var content: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            Text(content)
                .font(.body)
                .foregroundColor(.gray)
                .lineSpacing(5)
        }
        .padding(.vertical, 10)
    }
}

struct TermsAndCondtionScreen_Previews: PreviewProvider {
    static var previews: some View {
        TermsAndCondtionScreen()
    }
}
