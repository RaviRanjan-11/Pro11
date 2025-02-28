//
//  MyTeamViewModel.swift
//  Pro11
//
//  Created by Ravi Ranjan on 19/01/25.
//

import Foundation
import Combine
class MyTeamViewModel: ObservableObject {
    @Published var teamList: [TeamResponse]
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    var contestID: Int?

    private var cancellables = Set<AnyCancellable>()

    init(teamList: [TeamResponse], contestID: Int) {
        self.teamList = teamList
        self.contestID = contestID
    }
    
    func getSelectedTeamIDs() -> String {
        return teamList
            .filter { $0.issSelected }
            .map { $0.teamID.toString }
            .joined(separator: ",")
    }

    /// Join the contest with a selected team
    func joinContestWithTeam(_ team: TeamResponse, contestID: Int) {
        guard !getSelectedTeamIDs().isEmpty else {
            return
        }
        let selectedTeam = getSelectedTeamIDs()

        isLoading = true
        errorMessage = nil

        let route = TeamRoute(endpoint: .joinContestWith(contestID: contestID.toString, userTeamId: selectedTeam))

        NetworkManager.shared.request(route: route, responseType: BaseResponse<String>.self)
            .sink(receiveCompletion: { completion in
                self.isLoading = false
                if case .failure(let error) = completion {
                    self.errorMessage = error.localizedDescription
                }
            }, receiveValue: { response in
                // Handle successful join response
                print("Successfully joined contest with team ")
            })
            .store(in: &cancellables)
    }
}
