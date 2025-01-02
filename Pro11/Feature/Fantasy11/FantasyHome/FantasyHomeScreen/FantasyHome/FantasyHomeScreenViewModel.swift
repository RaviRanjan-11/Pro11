//
//  FantasyHomeScreenViewModel.swift
//  Pro11
//
//  Created by Ravi Ranjan on 21/12/24.
//

import Foundation
import Combine

class FantasyHomeScreenViewModel: ObservableObject {
    
    private var cancellables = Set<AnyCancellable>()
    
    @Published var upcomingMatches: FantasyHomeScreenServiceResponseModel? = nil
    
    // Get upcoming matches from the API
    func getUpcomingMatches() {
        let fantasyHomeRouter = FantasyHomeRouter(endpoint: .upcomingMatches("10"))
        
        NetworkManager.shared.request(route: fantasyHomeRouter, responseType: BaseResponse<FantasyHomeScreenServiceResponseModel>.self)
            .receive(on: DispatchQueue.main) // Ensure updates happen on the main thread
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Request completed successfully.")
                case .failure(let error):
                    print("Request failed with error: \(error)")
                }
            }, receiveValue: { [weak self] response in
                print("Token: \(response.message)")
                self?.upcomingMatches = response.data
            })
            .store(in: &cancellables)
    }

    // Get the contest header data for a given match ID
    func getContestHeaderDataForContest(from matchID: Int? = 102045) -> ContestHeaderData? {
        
        guard let matchID else {
            print("No match ID provided.")
            return nil
        }
        guard let matches = upcomingMatches?.data else {
            return nil
        }
        
        // Find the match by ID
        if let match = matches.first(where: { $0.id == matchID }) {
            return transformToContestHeaderData(from: match)
        } else {
            print("Match with ID \(matchID) not found.")
            return nil
        }
    }

    // Transform a MatchDataModel into ContestHeaderData
    private func transformToContestHeaderData(from match: MatchDataModel) -> ContestHeaderData {
        guard let team1 = match.matchID?.team1, let team2 = match.matchID?.team2 else {
            return ContestHeaderData(teamA: "Unknown", teamB: "Unknown", teamAImage: "default_teamA_image", teamBImage: "default_teamB_image", leftTime: "00:00:00", contestId: "\(match.id ?? 0)")
        }
        
        let teamA = team1.teamName ?? "Unknown"
        let teamB = team2.teamName ?? "Unknown"
        let teamAImage = team1.imageID.map { "\($0)" } ?? "default_teamA_image"
        let teamBImage = team2.imageID.map { "\($0)" } ?? "default_teamB_image"
        
        // Format the remaining time
        let leftTime = formatRemainingTime(startDate: match.startDate, endDate: match.endDate)
        
        let contestId = "\(match.id ?? 0)"
        
        return ContestHeaderData(teamA: teamA, teamB: teamB, teamAImage: teamAImage, teamBImage: teamBImage, leftTime: leftTime, contestId: contestId)
    }

    // Format the remaining time between startDate and endDate
    private func formatRemainingTime(startDate: Int?, endDate: Int?) -> String {
        guard let endDate = endDate else {
            return "00:00:00"
        }
        
        let currentTime = Date().timeIntervalSince1970
        let remainingTime = endDate - Int(currentTime)
        
        if remainingTime <= 0 {
            return "00:00:00"
        }
        
        let hours = remainingTime / 3600
        let minutes = (remainingTime % 3600) / 60
        let seconds = remainingTime % 60
        
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}
