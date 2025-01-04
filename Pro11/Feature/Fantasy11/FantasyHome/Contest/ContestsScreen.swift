//
//  ContestsScreen.swift
//  Pro11
//
//  Created by Ravi Ranjan on 23/12/24.
//
import SwiftUI
struct ContestsScreen: View {
    @State private var naviagteToJoinContestScreen: Bool = false
    @Environment(\.presentationMode) var presentationManager
    @StateObject var viewmodel: ContestViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Header Section
            
            
            if let contestHeaderData =  viewmodel.contestHeaderData {
                ContestHeaderView(contestHeaderData: contestHeaderData) {
                    presentationManager.wrappedValue.dismiss()
                }
            } 
            ScrollView {
                LazyVStack(spacing: 20) {
                    if !viewmodel.sectionedContests.isEmpty {
                        ForEach(viewmodel.sectionedContests.keys.sorted(), id: \.self) { contestType in
                            VStack(alignment: .leading, spacing: 10) {
                                Text(contestType)
                                    .font(.headline)
                                    .padding(.leading)
                                
                                ForEach(viewmodel.sectionedContests[contestType] ?? [], id: \.id) { contest in
                                    NavigationLink(
                                        destination: JoinContestScreen(contestData: contest)
                                            .navigationBarBackButtonHidden(true),
                                        isActive: $naviagteToJoinContestScreen
                                    ) {
                                        createContestCardView(for: contest)
                                            .onTapGesture {
                                                naviagteToJoinContestScreen.toggle()
                                            }
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                }
                            }
                        }
                    } else {
                        Text("No upcoming matches.")
                            .foregroundColor(.gray)
                            .padding()
                    }
                }
                .padding()
                
            }
        }
        .background(Color(.systemBackground))
        .onAppear {
            print("match id is :", viewmodel.contestHeaderData?.contestId ?? "" )
            viewmodel.getContestBy()
        }
    }

    func createContestCardView(for contest: ContestModelData?) -> some View {
        Group {
            if let contest = contest {
                ContestCardView(data: contest)
                    .frame(width: UIScreen.main.bounds.width * 0.9)
            } else {
                NoMatchView()
            }
        }
    }
}
#if DEBUG
#Preview {
    ContestsScreen(viewmodel: ContestViewModel(contestHeaderData: ContestHeaderData.mockData))
}

#endif
