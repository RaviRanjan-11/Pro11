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
    @Published var errorMessage: String?
    @Published var teamList: [TeamResponse]?
    @Published var navigateToMyTeam: Bool = false 

    var contestID: Int?
    var matchID: Int?
    private var cancellables = Set<AnyCancellable>()

    init(selectedPlayers: [PlayerModelProperty], contestID: Int? = nil, matchID: Int? = nil) {
        self.selectedPlayers = selectedPlayers
        self.contestID = contestID
        self.matchID = matchID
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
            errorMessage = "Captain or vice-captain not selected"
            return nil
        }
        let playerIds = selectedPlayers.map { $0.id }
        return CreateTeamRequest(
            userId: UserStorage.userId,
            teamName: "Pro11".createTeamName(),
            matchId: self.contestID ?? 0,
            captainId: captainId,
            viceCaptainId: viceCaptainId,
            playerIds: playerIds
        )
    }

    func createUserTeam() {
        guard let requestModel = getTeamRequestModel() else {
            errorMessage = "Captain or Vice-Captain is not selected."
            return
        }

        let route = TeamCreationRoute(endpoint: .createuserTeam)
        route.body = requestModel

        NetworkManager.shared.request(route: route, responseType: BaseResponse<CreateTeamResponse>.self)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    print("Request completed successfully.")
                case .failure(let error):
                    self?.errorMessage = "Failed to create team: \(error.localizedDescription)"
                }
            }, receiveValue: { [weak self] response in
                print(response)
                self?.getTeamList()
            })
            .store(in: &cancellables)
    }

    func getTeamList() {
        guard let matchId = contestID else { return }
        let route = TeamRoute(endpoint: .userTeamByMatch(matchId.toString, UserStorage.userId))

        NetworkManager.shared.request(route: route, responseType: BaseResponse<[TeamResponse]>.self)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Request completed successfully.")
                case .failure(let error):
                    self.errorMessage = "Failed to fetch team list: \(error.localizedDescription)"
                }
            }, receiveValue: { [weak self] response in
                self?.teamList = response.data
                self?.navigateToMyTeam = true
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
