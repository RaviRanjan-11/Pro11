//
//  TeamSelectionViewModel.swift
//  Pro11
//
//  Created by Ravi Ranjan on 02/01/25.
//

import Foundation
import Combine



class TeamSelectionViewModel: ObservableObject {
    
    private var cancellables = Set<AnyCancellable>()
    
    @Published var players: ContestTeamPlayersData?
    @Published var selectedPlayers: [PlayerModelProperty] = []
    @Published var teamAselectedPlayersData: [PlayerModelProperty] = []
    @Published var teamBselectedPlayersData: [PlayerModelProperty] = []
    @Published var navigateToCaptainSelection: Bool = false
    @Published var errorMessage: String? = nil
    @Published var totalCredit: Double = 100

    
    private let maxPlayersPerTeam = 6
    private let maxTotalPlayers = 11
    private let maxWK = 4
    private let maxBat = 6
    private let maxAR = 4
    private let maxBowl = 6
    
    func getPlayerByContestId(contestId: String ) {
        let route = TeamSelectionRoute(endpoint: .getPlayerForContestWith(contestId: contestId, order: .desc, sortedBy: .points))
        
        NetworkManager.shared.request(route: route, responseType: BaseResponse<ContestTeamPlayersData>.self)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Request completed successfully.")
                case .failure(let error):
                    print("Request failed with error: \(error)")
                }
            }, receiveValue: { [weak self] response in
                self?.players = response.data
            })
            .store(in: &cancellables)
    }
    
    /// **Add player with constraints**
    func addPlayer(player: PlayerModelProperty) {
        // Total player limit
        guard selectedPlayers.count < maxTotalPlayers else {
            print("⚠️ Cannot select more than \(maxTotalPlayers) players!")
            return
        }
        
        // Team limit check
        let sameTeamCount = selectedPlayers.filter { $0.teamSName == player.teamSName }.count
        guard sameTeamCount < maxPlayersPerTeam else {
            print("⚠️ Cannot select more than \(maxPlayersPerTeam) players from the same team!")
            return
        }
        
        // Role-based constraints
        switch player.role {
        case .wkBatter:
            guard selectedPlayers.filter({ $0.role == .wkBatter }).count < maxWK else {
                print("⚠️ Cannot select more than \(maxWK) Wicketkeeper!")
                return
            }
        case .batter:
            guard selectedPlayers.filter({ $0.role == .batter }).count < maxBat else {
                print("⚠️ Cannot select more than \(maxBat) Batsmen!")
                return
            }
        case .bowlingAllrounder:
            guard selectedPlayers.filter({ $0.role == .bowlingAllrounder }).count < maxAR else {
                print("⚠️ Cannot select more than \(maxAR) Allrounders!")
                return
            }
        case .bowler:
            guard selectedPlayers.filter({ $0.role == .bowler }).count < maxBowl else {
                print("⚠️ Cannot select more than \(maxBowl) Bowlers!")
                return
            }
        case .battingAllrounder:
            guard selectedPlayers.filter({ $0.role == .bowlingAllrounder }).count < maxAR else {
                print("⚠️ Cannot select more than \(maxAR) Allrounders!")
                return
            }
        }
        
        if(totalCredit < player.creditScore) {
            print("⚠️ Cannot select you have less credit than \(player.playerName)")
            return
        }
        
        // If all conditions pass, add the player
        selectedPlayers.append(player)
        
        totalCredit -= player.creditScore

        print("✅ Player added: \(player.playerName)")
    }

    
    /// **Remove a player from the selected list**
    func removePlayer(player: PlayerModelProperty) {
        selectedPlayers.removeAll { $0.id == player.id }
        totalCredit += player.creditScore

        print("❌ Removed player: \(player.playerName)")
    }
    
    
    func movetoSelectCaptainViceCaptain() {
           let wkCount = selectedPlayers.filter { $0.role == .wkBatter }.count
           let batterCount = selectedPlayers.filter { $0.role == .batter }.count
           let bowlerCount = selectedPlayers.filter { $0.role == .bowler }.count
           let allrounderCount = selectedPlayers.filter { $0.role == .bowlingAllrounder || $0.role == .battingAllrounder }.count
           
           if wkCount == 0 {
               errorMessage = "At least one Wicketkeeper is required!"
               debugPrint(errorMessage ?? "")
               return
           }
           if batterCount < 2 {
               errorMessage = "At least two Batsmen are required!"
               debugPrint(errorMessage ?? "")

               return
           }
           if bowlerCount < 2 {
               errorMessage = "At least two Bowlers are required!"
               debugPrint(errorMessage ?? "")

               return
           }
           if allrounderCount < 2 {
               errorMessage = "At least two Allrounders are required!"
               debugPrint(errorMessage ?? "")

               return
           }
        
        if selectedPlayers.count < 11 {
            errorMessage = "Team must contain minimum 11 players!"
            debugPrint(errorMessage ?? "")
            return
        }
        
           
           navigateToCaptainSelection.toggle()
           errorMessage = nil
           print("✅ Navigating to Captain Selection")
       }
    
    
}
