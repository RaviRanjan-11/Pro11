//
//  OTPScreen.swift
//  Pro11
//
//  Created by Ravi Ranjan on 21/12/24.
//

import SwiftUI

struct OTPScreen: View {
    @State private var otp: String = ""
    @State private var email: String = "example@email.com"
    @State private var timerCount: Int = 45
    @State private var isResendActive: Bool = false
    @Environment(\.presentationMode) var presentationManager
    @State private var navigateToHomeScreen: Bool = false // State for navigation

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                NavigationBar(title: "Verify OTP") //
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Enter the 6-digit OTP sent to")
                        .font(.headline)
                        .foregroundColor(.gray)
                    
                    HStack {
                        Text(email)
                            .font(.subheadline)
                            .fontWeight(.bold)
                        
                        Button {
                            // Action to edit email
                            presentationManager.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "pencil")
                                .foregroundColor(.red)
                                .padding(8)
                                .background(Color.green.opacity(0.1))
                                .clipShape(Circle())
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    TextField("Enter OTP", text: $otp)
                        .keyboardType(.numberPad)
                        .padding()
                        .frame(height: 50)
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        )
                    
                    HStack {
                        Button(action: {
                            resetTimer()
                        }) {
                            Text("Resend OTP")
                                .font(.subheadline)
                                .foregroundColor(isResendActive ? .blue : .gray)
                        }
                        .disabled(!isResendActive)
                        
                        Spacer()
                        
                        Text(timerCount > 0 ? "Resend in \(timerCount)s" : "")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .padding()
                .background(Color.blue.opacity(0.1))
                .cornerRadius(10)
                .padding(.horizontal)
                
                // NavigationLink for transitioning to the home screen
                NavigationLink(destination: HomeTabBar()
                    .navigationBarBackButtonHidden(true), isActive: $navigateToHomeScreen) {
                    EmptyView()
                }
                
                Button(action: {
                    // Submit OTP logic
                    print("OTP Submitted: \(otp)")
                    navigateToHomeScreen = true // Trigger navigation
                }) {
                    Text("Submit")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                Spacer()
                
            }
            .onAppear(perform: startTimer)
        }
    }
    
    // Start the timer
    private func startTimer() {
        timerCount = 45
        isResendActive = false
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if timerCount > 0 {
                timerCount -= 1
            } else {
                timer.invalidate()
                isResendActive = true
            }
        }
    }
    
    private func resetTimer() {
        startTimer()
    }
}

struct HomeScreen: View {
    var body: some View {
        VStack {
            Text("Welcome to Home Screen")
                .font(.largeTitle)
                .fontWeight(.bold)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.green.opacity(0.1))
    }
}

#Preview {
    OTPScreen()
}
