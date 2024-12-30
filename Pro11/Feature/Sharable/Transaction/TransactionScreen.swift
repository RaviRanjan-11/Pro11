//
//  TransactionScreen.swift
//  Pro11
//
//  Created by Ravi Ranjan on 21/12/24.
//

import SwiftUI


struct TransactionScreen: View {
    
    @State private var selectedTab: String = "All" // Default to "All"
    @Environment(\.presentationMode) var presentationMode

    var isPresentedFromTabBar: Bool = false
    let transactions = [
        Transaction(id: 1, type: "Recharge", amount: 50.0, date: "2024-12-01", message: "Bonus money"),
        Transaction(id: 2, type: "Withdraw", amount: 20.0, date: "2024-12-02"),
        Transaction(id: 3, type: "Recharge", amount: 100.0, date: "2024-12-05",message: "Promotional money addition for new signup on your referal code"),
        Transaction(id: 4, type: "Withdraw", amount: 30.0, date: "2024-12-10",message: "Promotional money addition for new signup on your referal code"),
    ]
    
    var filteredTransactions: [Transaction] {
        switch selectedTab {
        case "Recharge":
            return transactions.filter { $0.type == "Recharge" }
        case "Withdraw":
            return transactions.filter { $0.type == "Withdraw" }
        default:
            return transactions
        }
    }
    
    var body: some View {
        VStack {
            if !isPresentedFromTabBar {
                NavigationBarBack(title: "Transaction") {
                    presentationMode.wrappedValue.dismiss()
                }
            } else {
                NavigationBar(title: "Transaction")
            }
            
            // Segmented Control for selecting tab
            Picker("Select Tab", selection: $selectedTab) {
                Text("All").tag("All")
                Text("Recharge").tag("Recharge")
                Text("Withdraw").tag("Withdraw")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            List(filteredTransactions) { transaction in
                TransactionRow(transaction: transaction)
            }
        }
        .navigationBarHidden(true) // Hide default navigation bar to use custom one
    }
}

struct TransactionRow: View {
    var transaction: Transaction
    
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(transaction.message)
                Text(transaction.type)
                    .font(.headline)
                    .foregroundColor(transaction.type == "Recharge" ? .green : .red)
                Text("Date: \(transaction.date)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            Text("$\(transaction.amount, specifier: "%.2f")")
                .font(.subheadline)
                .foregroundColor(transaction.type == "Recharge" ? .green : .red)
        }
        .padding()
    }
}

struct Transaction: Identifiable {
    var id: Int
    var type: String
    var amount: Double
    var date: String
    var message:String = ""
}


struct TransactionScreen_Previews: PreviewProvider {
    static var previews: some View {
        TransactionScreen()
    }
}
