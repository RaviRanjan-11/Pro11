//
//  PlayerDetails.swift
//  Pro11
//
//  Created by Ravi Ranjan on 23/12/24.
//

import SwiftUI

struct PlayerDetails: View {
    
    @State var showDetail: Bool = false
    
    private var playerName: String = "Virat Kohli"
    private var playerRole: String = "Batsman"
    private var nationality: String = "India"
    private var birthYear: String = "1992"
    private var height: String = "5ft 11in"
    private var weight: String = "169lbs"
    var body: some View {
        
        
        VStack(alignment: .leading, spacing: 5) {
            Text(playerName)
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text(playerRole)
                    .fontWeight(.bold)
                Text("Right Handed Batsman")
            }
            HStack {
                Text("Nationality:")
                    .fontWeight(.bold)
                Text(nationality)
                Text("|")
                Text("Born ")
                    .fontWeight(.bold)
                Text("1992")
                
            }
            HStack {
                Text("Height:")
                    .fontWeight(.bold)
                Text(height)
                Text("|")
                Text("Weight:")
                    .fontWeight(.bold)
                Text(weight)
            }
            Text(" #Played Last Match")
                .fontWeight(.bold)
            
        }
    }
}

#Preview { PlayerDetails() }
