//
//  JoinContestOfferView.swift
//  Pro11
//
//  Created by Ravi Ranjan on 27/12/24.
//

import SwiftUI

struct JoinContestOfferView: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Earn ")
                    .font(.footnote)
                    .fontWeight(.bold)
                    .padding(.leading)
                
                Image("first")
                    .resizable()
                    .frame(width: 16, height: 16)
                Text("1 for every 10 spent on a contest entry")
                    .font(.footnote)
                    .fontWeight(.bold)
                Spacer()
                
            }
            .foregroundColor(.white)
            .frame(height:40)
            .background(
                LRGradientView()
            )
        }
    }
}

#Preview {
    JoinContestOfferView()
}
