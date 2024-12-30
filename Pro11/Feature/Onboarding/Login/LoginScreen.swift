//
//  LoginScreen.swift
//  Pro11
//
//  Created by Ravi Ranjan on 21/12/24.
//
import SwiftUI

import SwiftUI

struct LoginScreen: View {
    @State private var email: String = ""
    @State private var isAbove18: Bool = false
    @State private var showAlert: Bool = false
    
    // Navigation State
    @State private var navigateToOtpScreen = false
    @State private var navigateToCreateAccount = false
    
    var body: some View {
        VStack {
            NavigationBar()
            
            VStack(alignment: .leading, spacing: 15) {
                Text("Enter Registered Email")
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(.black)
                Text("We will send the OTP (One Time Password)")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(.gray)
                
                TextField("Enter Email", text: $email)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 8).fill(Color.white))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                
                HStack {
                    Button(action: {
                        isAbove18.toggle()
                    }) {
                        Image(systemName: isAbove18 ? "checkmark.square.fill" : "square")
                            .foregroundColor(isAbove18 ? .red : .gray)
                            .font(.system(size: 20))
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    Text("I certify that I am above 18 years")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.black)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
            
            Button(action: {
                if email.isEmpty || !isAbove18 {
                    showAlert = true
                } else {
                    // Navigate to HomeTabBar
                    navigateToOtpScreen = true
                }
            }) {
                Text("Submit")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(isAbove18 ? Color.red : Color.gray)
                    .cornerRadius(8)
            }
            .padding(.horizontal)
            .disabled(!isAbove18)
            
            // Terms and Conditions
            Text("By continuing, I agree to Pro11's \(Text("T&C").underline().foregroundColor(.red))")
                .font(.system(size: 12))
                .foregroundColor(.gray)
                .padding(.top, 10)
            
            // OR Divider
            HStack {
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray)
                
                Text("OR")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal, 30)
            
            Button(action: {
                navigateToCreateAccount = true
            }) {
                Text("Create New Account")
                    .foregroundColor(.red)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.red, lineWidth: 1)
                    )
            }
            .padding(.horizontal, 30)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity) // Ensures the VStack stretches
        .background(Color.white.ignoresSafeArea()) // Full-screen white background
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Invalid Input"), message: Text("Please enter a valid email and certify you are above 18 years."), dismissButton: .default(Text("OK")))
        }
        
        // NavigationLink to HomeTabBar
        NavigationLink(destination: OTPScreen()
            .navigationBarBackButtonHidden(true), isActive: $navigateToOtpScreen) {
            EmptyView()
        }
        
        // NavigationLink to RegistrationScreen
        NavigationLink(destination: RegistrationScreen()
                       , isActive: $navigateToCreateAccount) {
            EmptyView()
        }
    }
    
}

#Preview {
    LoginScreen()
}
