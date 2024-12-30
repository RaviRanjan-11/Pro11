//
//  JoinContestNavigationBar.swift
//  Pro11
//
//  Created by Ravi Ranjan on 27/12/24.
//

import SwiftUI

struct JoinContestNavigationBar: View {
    var contestTime: String
    var backButtonAction: () -> Void
    var body: some View {
        
        VStack {
            HStack {
                Button(action: {
                    backButtonAction()
                }) {
                    Image(systemName: "chevron.backward")
                        .resizable()
                        .frame(width: 10, height: 16)
                        .font(.title)
                        .foregroundColor(.white)
                    
                    
                }
                .padding(.trailing, 20)
                VStack(alignment: .leading) {
                    Text("STA vs THU")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text(contestTime)
                        .font(.caption)
                        .foregroundColor(.white)
                }
                Spacer()
            
            }
            .padding()
            .background(LRGradientView())
            

        }
    }
}

#Preview {
    JoinContestNavigationBar(contestTime: "15h:30m",backButtonAction: {})
}
