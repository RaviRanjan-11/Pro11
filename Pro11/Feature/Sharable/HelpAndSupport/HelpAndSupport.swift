//
//  HelpAndSupport.swift
//  Pro11
//
//  Created by Ravi Ranjan on 21/12/24.
//

import SwiftUI

struct HelpAndSupport: View {
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            NavigationBarBack(title: "Help & Support") {
                presentationMode.wrappedValue.dismiss()
            }
            Spacer()
           
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    HelpAndSupport()
}
