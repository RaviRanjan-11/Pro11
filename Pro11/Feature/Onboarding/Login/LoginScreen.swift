//
//  LoginScreen.swift
//  Pro11
//
//  Created by Ravi Ranjan on 21/12/24.
//
import SwiftUI
struct LoginScreen: View {
    
    @StateObject private var viewModel = LoginViewModel()
    @State private var navigateToRegister = false
    
    var body: some View {
        ZStack {
            VStack {
                NavigationBar()
                
                VStack(alignment: .leading, spacing: 15) {
                    Text("Enter Registered Email")
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundColor(.black)
                    Text("We will send the OTP (One Time Password)")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.gray)
                    
                    TextField("Enter Email", text: $viewModel.email)
                        .keyboardType(.emailAddress)
                        .disableAutocorrection(true)
                        
                        .autocapitalization(.none)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).fill(Color.white))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                                            
                    HStack {
                        Button(action: {
                            viewModel.isAbove18.toggle()
                        }) {
                            Image(systemName: viewModel.isAbove18 ? "checkmark.square.fill" : "square")
                                .foregroundColor(viewModel.isAbove18 ? .red : .gray)
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
                    if viewModel.validateForm() {
                        viewModel.requestOTP()
                        print("Form is valid. Navigate to OTP screen.")
                    }
                }) {
                    Text("Submit")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(viewModel.isSubmitButtonDisabled ? Color.gray : Color.red)
                        .cornerRadius(8)
                }
                .padding(.horizontal)
                .disabled(viewModel.isSubmitButtonDisabled)
                
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
                    navigateToRegister.toggle()
                    print("Navigate to create account screen.")
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
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white.ignoresSafeArea())
            .background(
                NavigationLink(destination: OTPScreen(email: viewModel.email, token: viewModel.token ?? "")
                    .navigationBarBackButtonHidden(true), isActive: $viewModel.navigateToOTP) {
                        EmptyView()
                    }
            )
            .background(
                NavigationLink(destination: RegistrationScreen()
                    .navigationBarBackButtonHidden(true), isActive: $navigateToRegister) {
                        EmptyView()
                    }
            )
            
            
            
            if viewModel.showAlert {
                Pro11Alert(title: viewModel.loginResponse?.message ?? "Error", message: viewModel.loginResponse?.error?.message ?? "", buttonTitle: "Ok") {
                    debugPrint("ok")
                    viewModel.showAlert = false
                }
            }
        }
        
    }
}

#Preview {
    LoginScreen()
}
