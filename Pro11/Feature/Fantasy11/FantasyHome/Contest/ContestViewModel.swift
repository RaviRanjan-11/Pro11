//
//  ContestViewModel.swift
//  Pro11
//
//  Created by Ravi Ranjan on 29/12/24.
//

import Foundation
import Combine
import Foundation
import Combine

class ContestViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    
    @Published var contests: [ContestModelData] = []
    @Published var sectionedContests: [String: [ContestModelData]] = [:]
    
    func getContestBy(match id: String = "99786") {
        let fantasyHomeRouter = ContestRoute(endpoint: .getContestByMatchID(id))
        
        NetworkManager.shared.request(route: fantasyHomeRouter, responseType: BaseResponse<[ContestModelData]>.self)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Request completed successfully.")
                case .failure(let error):
                    print("Request failed with error: \(error)")
                }
            }, receiveValue: { [weak self] response in
                print("Message: \(response.message)")
                guard let contests = response.data else { return }
                self?.contests = contests
                self?.groupContestsByType()
            })
            .store(in: &cancellables)
    }
    
    private func groupContestsByType() {
        sectionedContests = Dictionary(grouping: contests, by: { $0.contestType })
    }
}
