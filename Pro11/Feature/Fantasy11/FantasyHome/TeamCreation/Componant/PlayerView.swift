//
//  PlayerView.swift
//  Pro11
//
//  Created by Ravi Ranjan on 28/12/24.
//

import SwiftUI

struct PlayerView: View {
    

    var body: some View {
        VStack {
            HStack {
                Button{
                    
                } label: {
                    Text("SELECTED BY")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                }
                Spacer()
                Button{
                    
                } label: {
                    Text("POINTS")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                }
                .padding(.leading, 50)
                Spacer()
                Button{
                    
                } label: {
                    Text("CREDITS")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                }
            }
            .padding(.horizontal)
            .padding(.bottom)
            Divider()
            ScrollView(showsIndicators: false){
                
                ForEach(0 ..< 5) { item in
                    PlayerCard()
                        
                }
            }
        }
    }
}

#Preview {
    PlayerView()
}
