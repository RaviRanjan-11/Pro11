//
//  RegistrationScreen.swift
//  Pro11
//
//  Created by Ravi Ranjan on 21/12/24.
//

import SwiftUI
import Combine

struct RegistrationScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel = RegistrationViewModel()
    @State private var showSuccessAlert = false
    
    var body: some View {
        
        ZStack {
            VStack {
                NavigationBar(title: "Registration")
                
                ScrollView {
                    VStack(alignment: .leading) {
                        
                        VStack(alignment: .leading, spacing: 14) {
                            CustomTextField(
                                placeholder: "Enter Name",
                                text: $viewModel.name,
                                keyboardType: .alphabet
                            )
                            CustomTextField(
                                placeholder: "Enter Email",
                                text: $viewModel.email,
                                keyboardType: .emailAddress
                            )
                            CustomTextField(
                                placeholder: "Enter Phone Number",
                                text: $viewModel.mobile,
                                keyboardType: .phonePad
                            )
                            CustomTextField(
                                placeholder: "Enter Referral Code [optional]",
                                text: $viewModel.referralCode,
                                keyboardType: .alphabet
                            )
                            
                        }
                        
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
                        .padding(.top, 10)
                        .padding(.horizontal, 10)
                        .padding(.bottom, 5)
                        
                        ConditionalButton(title: "Submit", action: {
                            viewModel.submitRegistration()
                        }, isEnabled: viewModel.isFormValid, backgroundColor: .red)
                        .padding(.top, 10)
                        
                        ConditionalButton(title: "Back to Login", action: {
                            presentationMode.wrappedValue.dismiss()
                        }, isEnabled: true, backgroundColor: .clear, foregroundColor: .gray)
                        .padding(.top, 10)
                        Spacer()
                    }
                    .padding()
                    
                }
            }
            .navigationBarBackButtonHidden(true)
            
            if viewModel.showAlert {
                Pro11Alert(title: viewModel.alert.type,
                           message: viewModel.alert.message,
                           buttonTitle: "Ok", buttonAction: { viewModel.showAlert = false
                    if(viewModel.isSuccess){
                        presentationMode.wrappedValue.dismiss()
                    }
                    
                    
                })
            }
            //
            
        }
    }
}

struct RegistrationScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationScreen()
    }
}

import SwiftUI

import SwiftUI

struct Pro11Alert: View {
    var title: String
    var message: String
    var buttonTitle: String
    var buttonAction: () -> Void
    
    var body: some View {
        ZStack {
            // Semi-transparent background
            Color.black.opacity(0.2)
                .edgesIgnoringSafeArea(.all) // Extend background to cover entire screen
            
            VStack(spacing: 20) {
                Text(title)
                    .font(.headline)
                    .padding(.top, 20)
                
                Text(message)
                    .font(.subheadline)
                    .padding(.horizontal, 20)
                
                Button(action: buttonAction) {
                    Text(buttonTitle)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 20)
                }
            }
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 10)
            .padding(40)
        }
    }
}


#Preview{
    Pro11Alert(title: "Title", message: "Message", buttonTitle: "Button", buttonAction: {})
}
