//
//  AllMatchesViewModel.swift
//  Pro11
//
//  Created by Ravi Ranjan on 25/12/24.
//

import Foundation
import Combine
class AllMatchesViewModel:ObservableObject {
    
    private var cancellables = Set<AnyCancellable>()
    
    @Published var upcomingMatches: FantasyHomeScreenServiceResponseModel? = nil
    
     func getUpcomingMatches() {
         let fantasyHomeRouter = FantasyHomeRouter(endpoint: .upcomingMatches("100"))
        
        NetworkManager.shared.request(route: fantasyHomeRouter, responseType: BaseResponse<FantasyHomeScreenServiceResponseModel>.self)
            .receive(on: DispatchQueue.main)
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
}
