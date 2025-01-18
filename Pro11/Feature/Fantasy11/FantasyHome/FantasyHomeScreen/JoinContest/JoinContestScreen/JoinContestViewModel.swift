//
//  JoinContestViewModel.swift
//  Pro11
//
//  Created by Ravi Ranjan on 17/01/25.
//

import Foundation
import Combine

class JoinContestViewModel:ObservableObject {
    
    var matchId:Int?
    private var cancellables = Set<AnyCancellable>()
    @Published var teamList:[TeamResponse]?
    
    
    
    func setMatchId(_ id:Int){
        matchId = id
    }
    
    func getTeamList(onNavigateToMyTeam: @escaping () -> Void, onNavigateToCreateTeam: @escaping () -> Void) {
        
        guard let matchId = matchId else { return }
        let route = TeamRoute(endpoint: .userTeamByMatch(matchId.toString, UserStorage.userId))

        NetworkManager.shared.request(route: route, responseType: BaseResponse<[TeamResponse]>.self)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Request completed successfully.")
                case .failure(let error):
                    print("Request failed with error: \(error)")
                }
            }, receiveValue: { [weak self] response in
                self?.teamList = response.data
                if let teamList = self?.teamList, !teamList.isEmpty {
                    onNavigateToMyTeam()
                } else {
                    onNavigateToCreateTeam()
                }
            })
            .store(in: &cancellables)
    }

}
