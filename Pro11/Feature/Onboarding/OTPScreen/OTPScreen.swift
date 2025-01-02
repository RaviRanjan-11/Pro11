//
//  OTPScreen.swift
//  Pro11
//
//  Created by Ravi Ranjan on 21/12/24.
//

import SwiftUI

struct OTPScreen: View {
    
    @StateObject private var viewModel: OTPScreenViewModel
    @Environment(\.presentationMode) var presentationManager
    
    init(email: String, token: String) {
           _viewModel = StateObject(wrappedValue: OTPScreenViewModel(email: email, token: token))
    }
    var body: some View {
            ZStack {
                VStack(spacing: 20) {
                    NavigationBar(title: "Verify OTP")
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Enter the 6-digit OTP sent to")
                            .font(.headline)
                            .foregroundColor(.gray)
                        
                        HStack {
                            Text(viewModel.email)
                                .font(.subheadline)
                                .fontWeight(.bold)
                            
                            Button {
                                // Action to edit email
                                presentationManager.wrappedValue.dismiss()
                            } label: {
                                Image("pencil")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .padding(8)
                                    .background(Color.green.opacity(0.1))
                                    .clipShape(Circle())
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TextField("Enter OTP", text: $viewModel.otp)
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
                                viewModel.resetTimer()
                            }) {
                                Text("Resend OTP")
                                    .font(.subheadline)
                                    .foregroundColor(viewModel.isResendActive ? .blue : .gray)
                            }
                            .disabled(!viewModel.isResendActive)
                            
                            Spacer()
                            
                            Text(viewModel.timerCount > 0 ? "Resend in \(viewModel.timerCount)s" : "")
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
                        .navigationBarBackButtonHidden(true), isActive: $viewModel.navigateToHomeScreen) {
                            EmptyView()
                        }
                    
                    Button(action: {
                        viewModel.submitOTP()
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
                .onAppear(perform: viewModel.startTimer)
                .onDisappear(perform: viewModel.stopTimer)
                
                if viewModel.hasError {
                
                    Pro11Alert(title: "", message: "", buttonTitle: ""){
                        viewModel.hasError = false
                    }
                }
            }
    }
}


#Preview {
    OTPScreen(email: "myubuntuu@gmail.com", token: "123456")
}
