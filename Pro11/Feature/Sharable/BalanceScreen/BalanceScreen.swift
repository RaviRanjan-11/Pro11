//
//  BalanceScreen.swift
//  Pro11
//
//  Created by Ravi Ranjan on 21/12/24.
//

import SwiftUI

struct BalanceScreen: View {
    @State private var availableFunds: Double = 500.0  // Example funds
    @State private var depositAmount: String = ""
    @State private var withdrawAmount: String = ""
    @Environment(\.presentationMode) var presentationMode
    var isPresentedFromTabBar: Bool = true
    
    
    var body: some View {
        VStack {
            if !isPresentedFromTabBar {
                NavigationBarBack(title: "Balance") {
                    presentationMode.wrappedValue.dismiss()
                }
            } else {
                NavigationBar(title: "Balance")
            }
            
            
            ScrollView {
                VStack(spacing: 20) {
                    // Available Funds
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Available Funds")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        Text("$\(availableFunds, specifier: "%.2f")")
                            .font(.system(size: 32, weight: .semibold))
                            .foregroundColor(.green)
                        
                        Divider()
                            .padding(.vertical, 10)
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        HStack(spacing: 10) {
                            Image("wallet")  // Use your image here
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                            
                            Text("Deposits")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            Button(action: {
                                if let deposit = Double(depositAmount), deposit > 0 {
                                    availableFunds += deposit
                                    depositAmount = ""
                                }
                            }) {
                                Text("Add Funds")
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                    .padding()
                                    .background(Color.blue)
                                    .cornerRadius(8)
                            }
                        }
                        .padding(.top, 20)
                        
                        
                    }
                    
                    Divider()
                        .padding(.vertical, 10)
                    
                    // Winning Section
                    VStack(alignment: .leading, spacing: 10) {
                        HStack(spacing: 10) {
                            Image("medal")  // Use your image here
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                            
                            Text("Winnigs")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            Button(action: {
                                if let deposit = Double(depositAmount), deposit > 0 {
                                    availableFunds += deposit
                                    depositAmount = ""
                                }
                            }) {
                                Text("Withdraw Funds")
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                    .padding()
                                    .background(Color.red)
                                    .cornerRadius(8)
                            }
                        }
                        .padding(.top, 20)
                        
                        
                    }
                    
                    Divider()
                        .padding(.vertical, 10)
                    
                    
                }
                .padding()
            }
        }
        .navigationBarHidden(true)
    }
}

struct BalanceScreen_Previews: PreviewProvider {
    static var previews: some View {
        BalanceScreen()
    }
}