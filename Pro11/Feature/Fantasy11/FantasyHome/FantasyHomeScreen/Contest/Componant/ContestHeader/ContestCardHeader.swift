//
//  ContestCardHeader.swift
//  Pro11
//
//  Created by Ravi Ranjan on 27/12/24.
//

import SwiftUI

struct ContestHeaderView: View {
   
    var contestHeaderData: ContestHeaderData?
    var action: () -> Void

    var body: some View {
        
        HStack {
            
            Button(action: {
                action()
            }) {
                Image("left-arrow")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .font(.title)
                    .foregroundColor(.white)
                
            }
            .padding(.horizontal)
            
            
            VStack(alignment: .leading) {
                HStack {
                   
                    Text(contestHeaderData?.steamA ?? "")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    
                    Text("v")
                        .font(.callout)
                        .foregroundColor(.white)
                    
                    Text(contestHeaderData?.steamB ?? "")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                }
                
                Text(contestHeaderData?.leftTime ?? "")
                    .font(.caption)
                    .foregroundColor(.white)
                
            }
            Spacer()
            
            HStack {
                Image(systemName:"wallet.bifold.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                    
                Text(" 0")
                    .font(.callout)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                ImageButton(image: "plus.circle.fill", isSystemImage: true,tintcolor: .green,height: .small, width: .small){
                    
                }
                .padding(.leading)

            }
            .padding(.all, 10)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(hex: "#2F4F4F"))
            )
            
            
        }
        .padding(.vertical)
        .padding(.trailing)
        .background(
            LRDGradientView()
        )
    }
}

#if DEBUG

#Preview {
    ContestHeaderView( contestHeaderData: ContestHeaderData.mockData, action: {})
}
#endif
