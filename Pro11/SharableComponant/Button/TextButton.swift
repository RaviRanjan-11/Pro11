//
//  TextButton.swift
//  Pro11
//
//  Created by Ravi Ranjan on 25/12/24.
//

import SwiftUI

struct TextButton: View {
    
    var title: String = "view more"
    var callBack: () -> Void = { }
    var body: some View {
        VStack {
            

            Button {
                callBack()
                
            } label: {
                HStack {
                    Text(title)
                        .foregroundColor(.white)
                        .font(.subheadline)
                    
                }
                .padding(.horizontal)
                .padding(.vertical, 5)
                .background(
                    RoundedRectangle(cornerRadius: 5, style: .circular)
                        .fill(.gray)
                )
            }
            
            
        }
    }
}

#Preview {
    TextButton()
}
