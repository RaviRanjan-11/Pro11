//
//  BalanceScreen.swift
//  Pro11
//
//  Created by Ravi Ranjan on 21/12/24.
//

import SwiftUI

struct BalanceScreen: View {
    
    @State private var depositAmount: String = ""
    @State private var withdrawAmount: String = ""
    @Environment(\.presentationMode) var presentationMode
    var isPresentedFromTabBar: Bool = true
    
    @State private var isEligibleToWithdraw: Bool = true
    @StateObject private var viewmodel: BalanceViewModel = .init()
    @State var isDepositSectionOpen: Bool = false
    var body: some View {
        ZStack {
            Color.gray.opacity(0.1)
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
                        HStack {
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Available Funds")
                                    .font(.system(size: 15))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.gray)
                                
                                Text("\(viewmodel.balanceResponse?.currentBalance ?? 0.0, specifier: "%.2f")")
                                    .font(.system(size: 22, weight: .bold))
                                    .foregroundColor(.black)
                                
                            }
                            
                            Spacer()
                            
                            Button{
                                withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
                                    isDepositSectionOpen.toggle()
                                }                            }label: {
                                    HStack{
                                        Image(systemName: "plus")
                                            .tint(.white)
                                        Text("Add Cash")
                                            .foregroundColor(.white)
                                            .fontWeight(.bold)
                                        
                                    }
                                    .padding(.horizontal,20)
                                    .padding(.vertical, 10)
                                    .background(ColorPallate.mutatedDArkGreen)
                                    .cornerRadius(8)
                                }
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 10)
                        
                        if isDepositSectionOpen {
                            
                            
                            VStack(alignment: .leading) {
                                Text("Amount to Add")
                                    .font(.system(size: 15))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.gray)
                                
                                TextField("Deposit Amount", text: $depositAmount)
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(ColorPallate.mutatedDArkGreen.opacity(0.1))
                                    )
                                
                                Button {
                                    if let deposit = Double(depositAmount), deposit > 0 {
                                        viewmodel.createOrderForWallet(with: depositAmount)
                                    }
                                } label: {
                                    HStack(alignment: .center) {
                                        Spacer()
                                        Text("Deposit")
                                            .fontWeight(.bold)
                                            .foregroundStyle(.white)
                                        
                                        Spacer()
                                        
                                    }
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 12)
                                        .fill(ColorPallate.mutatedDArkGreen))
                                }
                                .padding(.top, 10)
                                
                            }
                            .padding()
                            .transition(.opacity.combined(with: .move(edge: .top)))
                            .animation(.easeInOut(duration: 0.4), value: isDepositSectionOpen)
                            
                            
                            
                        }
                        
                        Divider()
                        
                        
                        VStack(alignment: .leading, spacing: 10) {
                            HStack(spacing: 10) {
                                Image("wallet")  // Use your image here
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                
                                Text("Deposits")
                                    .font(.system(size: 16))
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                
                            }
                            
                        }
                        .padding(.horizontal, 16)
                        
                        // Winning Section
                        VStack(alignment: .leading, spacing: 10) {
                            HStack(spacing: 10) {
                                Image("medal")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                
                                Text("Winnigs")
                                    .font(.system(size: 16))
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                Button(action: {
                                    if let deposit = Double(depositAmount), deposit > 0 {
                                        //                                    availableFunds += deposit
                                        //                                    depositAmount = ""
                                    }
                                }) {
                                    Text(isEligibleToWithdraw ? "Withdraw" : "Verify to Withdraw")
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                        .padding(.horizontal, 20)
                                        .padding(.vertical, 10)
                                        .background(isEligibleToWithdraw ? Color.green : Color.red)
                                        .cornerRadius(8)
                                    
                                }
                                
                            }
                            .padding(.horizontal, 16)
                            
                            Text("Verify your account to be eligible to withdraw")
                                .padding(.vertical)
                                .foregroundColor(.red)
                                .padding(.horizontal, 16)
                            
                        }
                        
                        Divider()
                        
                    }
                }
            }
            .onAppear{
                viewmodel.fetchBalance()
            }
            .navigationBarHidden(true)
        }
    }
}

struct BalanceScreen_Previews: PreviewProvider {
    static var previews: some View {
        BalanceScreen()
    }
}
