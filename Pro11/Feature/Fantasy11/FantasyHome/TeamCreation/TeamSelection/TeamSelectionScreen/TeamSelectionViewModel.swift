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

    
    func getPlayerByContestId(contestId: String = "91814")  {
        let route = TeamSelectionRoute(endpoint: .getPlayerForContestWith(contestId: contestId, order: .desc, sortedBy: .points))
        
        NetworkManager.shared.request(route: route, responseType: BaseResponse<ContestTeamPlayersData>.self)
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
                self?.players = response.data
//                self?.upcomingMatches = response.data
            })
            .store(in: &cancellables)
    }
}
