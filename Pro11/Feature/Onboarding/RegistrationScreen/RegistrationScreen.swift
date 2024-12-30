//
//  RegistrationScreen.swift
//  Pro11
//
//  Created by Ravi Ranjan on 21/12/24.
//

import SwiftUI

struct RegistrationScreen: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var mobile: String = ""
    @State private var referaCode: String = ""
    @State private var isAbove18: Bool = false
    @State private var showAlert: Bool = false
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        
        VStack {
            NavigationBar(title: "Registration")
            
            ScrollView {
                VStack(alignment: .leading) {
                    
                    VStack(alignment: .leading, spacing: 14) {
                        CustomTextField(
                            placeholder: "Enter Name",
                            text: $name,
                            keyboardType: .alphabet
                        )
                        CustomTextField(
                            placeholder: "Enter Email",
                            text: $email,
                            keyboardType: .emailAddress
                        )
                        CustomTextField(
                            placeholder: "Enter Phone Number",
                            text: $mobile,
                            keyboardType: .phonePad
                        )
                        CustomTextField(
                            placeholder: "Enter Referral Code [optional]",
                            text: $referaCode,
                            keyboardType: .alphabet
                        )
                    }
                    
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
                    .padding(.top, 10)
                    .padding(.horizontal, 10)
                    .padding(.bottom, 5)
                    
                    ConditionalButton(title: "Submit", action: {
                        if email.isEmpty || !isAbove18 {
                            showAlert = true
                        } else {
                            
                        }
                    }, isEnabled: isAbove18, backgroundColor: .blue)
                    .padding(.top,10)
                    
                    ConditionalButton(title: "Back to Login", action: {
                        presentationMode.wrappedValue.dismiss()
                    }, isEnabled: true, backgroundColor: .red)
                    .padding(.top, 10)
                    Spacer()
                }
                .padding()
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Error"), message: Text("Please fill all fields"))
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct RegistrationScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationScreen()
    }
}
