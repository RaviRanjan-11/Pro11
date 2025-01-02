//
//  MyContest.swift
//  Pro11
//
//  Created by Ravi Ranjan on 22/12/24.
//
import SwiftUI
struct MyContest: View {
    
    @State private var selectedTab: String = "Upcoming"
    let tabs = ["Upcoming", "Live", "Completed"]
    
    var body: some View {
        VStack {
            
            NavigationBar(title: "My Contest")
            
            // Tabs
            
            Picker("Select Tab", selection: $selectedTab) {
                Text("Live").tag("live")
                Text("Upcoming").tag("uplcoming")
                Text("Completed").tag("completed")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            InfoView {
            }
        }
        
        
        
    }
}

#Preview {
    MyContest()
}


