//
//  PlayerInfoScreen.swift
//  Pro11
//
//  Created by Ravi Ranjan on 23/12/24.
//

import SwiftUI

struct PlayerInfoScreen: View {
    
    
    var body: some View {
        
        VStack(alignment: .leading) {
            PlayerMainDetail()
                .padding()
                .background(Color.gray.opacity(0.1))
            
            ScrollView {
                PlayerDetails()
                    .padding(.horizontal)
                
            }
            .padding(.vertical)
            
        }
        
        
    }
}

#Preview {
    PlayerInfoScreen()
}

struct BottomNameImage: View {
    
    
    private var name: String?
    
    init(name: String? = nil) {
        self.name = name
    }
    var body: some View {
        
        VStack {
            Image("cricketer")
                .resizable()
                .frame(width: 100, height: 100)
            
            if name != nil {
                Text("Virat Kohli")
                    .font(.headline)
            }
            
        }
        
        
    }
}

#Preview {
    BottomNameImage()
}


struct PlayerMainDetail:View {
    @Environment(\.presentationMode) var presentationManager
    var body: some View {
        VStack {
            HStack {
                ImageButton(image: "close"){
                    print("Clicked on close")
                    presentationManager.wrappedValue.dismiss()
                }
                Text("Player Info")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.black)
                    .padding(.horizontal, 20)
                Spacer()
            }
            HStack {
                Player(width: 80, height: 80)
                Spacer()
                VStack {
                    
                    Text("Points")
                    Text("66")
                        .font(.title)
                        .fontWeight(.bold)
                }
                Spacer()
                VStack {
                    Text("Credit")
                    Text("324")
                        .font(.title)
                        .fontWeight(.bold)

                }
                Spacer()
            }
            
        }
    }
}


#Preview {
    PlayerMainDetail()
}
