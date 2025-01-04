//
//  TextButton.swift
//  Pro11
//
//  Created by Ravi Ranjan on 25/12/24.
//

import SwiftUI

//1wk, 1all 2 bat, 2bow
struct TextButton: View {
    
    var title: String = "view more"
    var imageName: String = ""
    var callBack: () -> Void = { }
    var body: some View {
        VStack {
            
            Button {
                callBack()
                
            } label: {
                HStack {
                    if(imageName != "") {
                        Image(systemName: "arrow.right")
                    }
                    Text(title)
                        .foregroundColor(.white)
                        .font(.subheadline)
                    
                }
                .padding(.horizontal)
                .padding(.vertical, 5)
                .background(
                    RoundedRectangle(cornerRadius: 5, style: .circular)
                        .fill(ColorPallate.mutatedDArkGreen)
                )
            }
            
            
        }
    }
}

#Preview {
    TextButton()
}
