//
//  JoinContestCard.swift
//  Pro11
//
//  Created by Ravi Ranjan on 27/12/24.
//

import SwiftUI


struct JoinContestCard:View {
    var joinContestCallback: (() -> Void)?
    var body: some View {
        
        VStack {
            HStack{
                Image(systemName: "checkmark.seal.fill")
                    .tint(Color.green)
                Text("Guarnteed prize pool")
                Spacer()
            }
            
            GradientProgressBar(maxValue: 100, currentValue: 10)
            
            
            JoinContestButton(price: "149") {
                print("Join")
                joinContestCallback?()
            }
            HStack {
                IconImageWithTitleAndValue(imageName: "first", title: "Prizes", value: "149")
                IconImageWithTitleAndValue(imageName: "first", title: "winner", value: "65%")
                IconImageWithTitleAndValue(imageName: "first", title: "Prizes", value: "upto 11")
                Spacer()
            }
            
            
        }
        .padding(.horizontal)
        .padding(.top, 10)
        
    }
}
#Preview {
    JoinContestCard()
}
