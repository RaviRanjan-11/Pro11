//
//  ReferAndEarnScreen.swift
//  Pro11
//
//  Created by Ravi Ranjan on 21/12/24.
//

import SwiftUI

struct ReferAndEarnScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var referralCode: String = "ABC123XYZ"  // Example referral code
    @State private var isCodeCopied = false
    var isPresentedFromTabBar: Bool = false

    var body: some View {
        VStack {
            if !isPresentedFromTabBar {
                NavigationBarBack(title: "Refer and Earn") {
                    presentationMode.wrappedValue.dismiss()
                }
            } else {
                NavigationBar(title: "Refer and Earn")
            }
            
            Image("referearn")
                .resizable()
                .scaledToFit()
                .frame(height: 200)  // Adjusted the height to reduce the space
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    // Refer text aligned to the start
                    HStack {
                        Text("Refer your friend to earn up to 200 points")
                            .font(.title2)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)  // Aligned to start
                    }
                    .padding(.top, 10)  // Added padding top for spacing
                    
                    // Referral Code Box with Copy Button
                    VStack(spacing: 15) {
                        HStack {
                            Text(referralCode)
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .cornerRadius(8)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal)
                            
                            Button(action: {
                                UIPasteboard.general.string = referralCode
                                isCodeCopied = true
                            }) {
                                Text(isCodeCopied ? "Copied!" : "Copy")
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                    .padding()
                                    .background(Color.blue)
                                    .cornerRadius(8)
                            }
                            .padding()
                        }
//                        .padding(.horizontal)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                        
                        
                        
                        // Share Button
                        Button(action: {
                            // Add your share action here, like using UIActivityViewController
                            print("Share your referral code")
                        }) {
                            Text("Share Referral Code")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .padding()
                                .background(Color.green)
                                .cornerRadius(8)
                                .frame(maxWidth: .infinity)
                        }
                        .padding(.horizontal)
                    }
                    
                    Spacer()
                    
                    // Steps Description
                     
                        VStack(alignment: .leading, spacing: 15) {
                            Text("1. Copy: Share your unique referral code with your friends.")
                                .font(.body)
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                            
                            Text("2. Signup: When your friend signs up with your referral code, you earn points.")
                                .font(.body)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            
                            Text("3. Redeem: Redeem points for exclusive rewards.")
                                .font(.body)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 20)
                    
                }
            }
            .padding()
        }
        .navigationBarHidden(true)
    }
}

struct ReferAndEarnScreen_Previews: PreviewProvider {
    static var previews: some View {
        ReferAndEarnScreen()
    }
}
