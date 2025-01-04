//
//  JoinContestNavigationBar.swift
//  Pro11
//
//  Created by Ravi Ranjan on 27/12/24.
//

import SwiftUI

struct JoinContestNavigationBar: View {
    var contestHeaderData: ContestHeaderData?
    var backButtonAction: () -> Void
    var body: some View {
        
        VStack {
            HStack {
                Button(action: {
                    backButtonAction()
                }) {
                    Image("left-arrow")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .font(.title)
                        .foregroundColor(.white)
                    
                    
                }
                .padding(.trailing, 20)
                VStack(alignment: .leading) {
                    Text("\(contestHeaderData?.steamA ?? "") vs \(contestHeaderData?.steamB ?? "")")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text(contestHeaderData?.leftTime ?? "")
                        .font(.caption)
                        .foregroundColor(.white)
                }
                Spacer()
            
            }
            .padding()
            .background(LRDGradientView())
            

        }
    }
}

#Preview {
    JoinContestNavigationBar(backButtonAction: {})
}
