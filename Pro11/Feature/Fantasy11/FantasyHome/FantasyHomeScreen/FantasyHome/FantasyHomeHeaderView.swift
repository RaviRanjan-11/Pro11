//
//  FantasyHomeHeaderView.swift
//  Pro11
//
//  Created by Ravi Ranjan on 29/12/24.
//

import SwiftUI


struct FantasyHomeHeaderView: View {
    @State private var selectedSport: String = "Cricket" // Default sport
    @State private var showDropdown: Bool = false

    let sports: [(name: String, icon: String)] = [
        ("Cricket", "cricket"), // Replace with actual image names
        ("Football", "football"),
        ("Tennis", "tennis"),
    ]
    let redColor = Color.red // Custom red color

    var body: some View {
        VStack(spacing: 0) {
            // Header
            ZStack {
                LRGradientView()
                        .ignoresSafeArea()

                HStack {
                    // Center: Pro11 Logo in Circle
                    Image("pro11") // Ensure "pro11" is in your Assets
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle()) // Circular shape
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: 2) // White border
                        )
                    
                    Button(action: {
                        withAnimation {
                            showDropdown.toggle()
                        }
                    }) {
                        HStack {
                            Text(selectedSport)
                                .font(.headline)
                                .foregroundColor(.white)
                            Image(systemName: showDropdown ? "chevron.up" : "chevron.down")
                                .foregroundColor(.white)
                        }
                    
                    }


                    Spacer()



                    ImageButton(image: "bell", isSystemImage: true,height: .small, width: .small)
                    {}
                        .foregroundColor(.white)
                        .padding()
                    

                }
                .padding()
            }
            .frame(height: 60)

            // Dropdown Menu
            if showDropdown {
                VStack(spacing: 0) {
                    ForEach(sports, id: \.name) { sport in
                        Button(action: {
                            withAnimation {
                                selectedSport = sport.name
                                showDropdown = false
                            }
                        }) {
                            HStack(spacing: 12) {
                                Image(sport.icon) // Ensure these icons are in Assets
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24, height: 24)
                                    .padding(6)
                                    .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                                    .clipShape(Circle()) // Circular background for icons
                                
                                Text(sport.name)
                                    .font(.headline)
                                    .foregroundColor(.primary)
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.white)
                            .cornerRadius(8) // Rounded corners for each item
                            .shadow(color: Color.gray.opacity(0.1), radius: 4, x: 0, y: 2) // Subtle shadow
                        }
                        .buttonStyle(PlainButtonStyle())
                        .hoverEffect(.highlight) // Adds a hover effect (for supported platforms)
                    }
                }
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.white)
                        .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 4)
                )
                .padding([.leading, .trailing], 16)
                .transition(.opacity) 
            }

        }
    }
}




#Preview {
    FantasyHomeHeaderView()
}
