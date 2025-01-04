//
//  CaptainSelectionViewModel.swift
//  Pro11
//
//  Created by Ravi Ranjan on 04/01/25.
//

import Foundation
import Combine
class CaptainSelectionViewModel: ObservableObject {
    
    @Published var selectedPlayers: [PlayerModelProperty]
    @Published var captain: PlayerModelProperty?
    @Published var viceCaptain: PlayerModelProperty?
    private var cancellables = Set<AnyCancellable>()

    
    init(selectedPlayers: [PlayerModelProperty]) {
        self.selectedPlayers = selectedPlayers
    }
    
    func setCaptain(player: PlayerModelProperty) {
        if viceCaptain?.id == player.id {
            viceCaptain = nil
        }
        captain = player
    }
    
    func setViceCaptain(player: PlayerModelProperty) {
        if captain?.id == player.id {
            captain = nil
        }
        viceCaptain = player
    }
    
    
    
    private func getTeamRequestModel() -> CreateTeamRequest? {
        
        guard let captainId = captain?.id, let viceCaptainId = viceCaptain?.id else {
            print("Captain or vice-captain not selected")
            return nil
        }
        
        // Prepare the JSON data
        let playerIds = selectedPlayers.map { $0.id }
        return CreateTeamRequest(
            userId: UserStorage.userId,
            teamName: "Pro11".createTeamName(),
            matchId: 91814,
            captainId: captainId,
            viceCaptainId: viceCaptainId,
            playerIds: playerIds
        )
    }
    func createUserTeam() {
        
        guard let requestModel = getTeamRequestModel() else {
            debugPrint("Some error occured")
            return
        }
        
        let route = TeamCreationRoute(endpoint: .createuserTeam)
        route.body = requestModel
        
        NetworkManager.shared.request(route: route, responseType: BaseResponse<CreateTeamResponse>.self)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Request completed successfully.")
                case .failure(let error):
                    print("Request failed with error: \(error)")
                }
            }, receiveValue: { [weak self] response in
                
//                self?.players = response.data
            })
            .store(in: &cancellables)
        
        
        
    }
}
import Foundation

extension String {
    // Function to generate a team name with "pro11" suffix, "T", and a random letter
    func createTeamName() -> String {
        // Random letter (A-Z)
        let randomLetter = String(UnicodeScalar(Int.random(in: 65...90))!)
        
        // Return the generated team name
        return self + UserStorage.token.hashValue.toString + "T" + randomLetter
    }
}
