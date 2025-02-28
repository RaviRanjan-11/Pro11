//
//  CreateTeamHeaderView.swift
//  Pro11
//
//  Created by Ravi Ranjan on 28/12/24.
//

import SwiftUI

struct CreateTeamHeaderView: View {
    @Environment(\.presentationMode) var presentationManager
    @Binding var selectedPlayers: [PlayerModelProperty]
    @Binding var totalCredit: Double

    var body: some View {
        
        VStack {
            
            HStack {
                Button(action: {
                    
                    presentationManager.wrappedValue.dismiss()
                    
                }) {
                    Image("left-arrow")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .font(.title)
                        .foregroundColor(.white)
                    
                    
                }
                .padding(.trailing, 20)
                VStack(alignment:.leading) {
                    
                    Text("Create Team")
                        .font(.headline)
                        .fontWeight(.bold)
                    Text("18h:30:00 left")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }
                .foregroundColor(.white)
                Spacer()
                ImageButton(image: "questionmark.circle.fill",isSystemImage: true, tintcolor: .white,height: .small, width: .small) {
                }
            }
            .padding()
            
            
            HStack {
                
                HStack {
                    Image("india")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
//                        .padding(.horizontal)
                    VStack{
                        Text("IND")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .background(.gray)
                            .cornerRadius(3)
//                        Text("\(selectedPlayers.count)")
//                            .font(.subheadline)
//                            .fontWeight(.bold)
//                            .foregroundColor(.white)
                    }
                }
                
                Spacer()
                
                VStack{
                    Text("Players")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text("\(selectedPlayers.count)/11")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                Spacer()
                
                VStack{
                    Text("Credit Left")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text("\(totalCredit.formatted(toPlaces: 1))")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                Spacer()
                HStack {
                   
                    VStack{
                        Text("AUS")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .background(.gray)
                            .cornerRadius(3)

//                        Text("4")
//                            .font(.subheadline)
//                            .fontWeight(.bold)
//                            .foregroundColor(.white)
                    }
                    Image("australia")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
//                        .padding(.horizontal, 5)
                }
                
            }
            .padding(.horizontal)
            .padding(.top,5)
            
            
            BoxProgressView(totalBoxes: 11, filledBoxes: selectedPlayers.count)
            Text("Max 7 Player from a team")
                .foregroundColor(.white)
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding(.bottom, 30)
            
          

        }
        .background(LRDGradientView())
        Spacer()
        

    }
}

#Preview {
    CreateTeamHeaderView(selectedPlayers: .constant([]), totalCredit: .constant(100))
}

struct BoxProgressView: View {
    let totalBoxes: Int
    let filledBoxes: Int

    var body: some View {
        HStack(spacing: 4) {
            ForEach(1...totalBoxes, id: \.self) { index in
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .strokeBorder(index <= filledBoxes ? Color.white : Color.gray, lineWidth: 2)
                        .background(index <= filledBoxes ? Color.green.opacity(0.2) : Color.clear)
                        .frame(width: 25, height: 20)
                    if index <= filledBoxes {
                        Text("\(index)")
                            .font(.headline)
                            .foregroundColor(.green)
                    }
                }
            }
        }
        .padding(.all, 5)
    }
}

#Preview {
    VStack {
        Text("Box Progress View")
            .font(.title2)
            .padding()
        
        BoxProgressView(totalBoxes: 11, filledBoxes: 11)
    }
    .padding()
}


extension Double {
    /// Rounds the double to the specified number of decimal places.
    /// - Parameter places: The number of decimal places to round to.
    /// - Returns: A new `Double` rounded to the given decimal places.
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    
    /// Converts the double to a string formatted to the specified decimal places.
    /// - Parameter places: The number of decimal places to format to.
    /// - Returns: A `String` representation of the double with the given decimal places.
    func formatted(toPlaces places: Int) -> String {
        return String(format: "%.\(places)f", self)
    }
}
