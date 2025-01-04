//
//  TeamSeletionMoverView.swift
//  Pro11
//
//  Created by Ravi Ranjan on 04/01/25.
//

import SwiftUI

struct TeamSeletionMoverView: View {
    var body: some View {
            HStack {
                HStack {
                    Button {
                        
                    }label: {
                        Image(systemName: "eye.fill")
                            .tint(.red)
                        Text("PREVIEW")
                            .font(.callout)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                    }
                    Image("line")
                   
                    
                    Button {
                        
                    }label: {
                        Image("teamwork")
                        Text("LINEUP")
                            .font(.callout)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                    }
                   

                    
                }

                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.init(hex: "#05143b").opacity(0.9))
                )
                
                
                Button {
                    
                } label: {
                    Text("NEXT")
                        .font(.callout)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 5)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.init(hex: "#122c6f").opacity(0.9))
                        )
                    
                    
                    
                }
                
            }
        
    }
}

#Preview {
    TeamSeletionMoverView()
}
