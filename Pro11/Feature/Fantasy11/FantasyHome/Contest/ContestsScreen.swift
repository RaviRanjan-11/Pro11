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
            
            ContestHeaderView(contestHeaderData: viewmodel.contestHeaderData) {
                presentationManager.wrappedValue.dismiss()
            }
            
            ScrollView {
                LazyVStack(spacing: 20) {
                    if !viewmodel.sectionedContests.isEmpty {
                        ForEach(viewmodel.sectionedContests.keys.sorted(), id: \.self) { contestType in
                            VStack(alignment: .leading, spacing: 10) {
                                Text(contestType.description.removeUnderscoresAndAddSpaces())
                                    .font(.headline)
                                    .padding(.leading)
                                    .background(
                                        RoundedRectangle(cornerRadius: 5)
                                            .fill(.yellow)
                                    )
                                
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
                        Spacer()
                        NoMatchView(title: "No Contest Found")
                        Spacer()
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
extension String {
    // Function to replace underscores with spaces
    func removeUnderscoresAndAddSpaces() -> String {
        return self.replacingOccurrences(of: "_", with: " ")
    }
}
