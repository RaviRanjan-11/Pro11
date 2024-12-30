//
//  FantasyHomeScreenViewModel.swift
//  Pro11
//
//  Created by Ravi Ranjan on 21/12/24.
//

import Foundation
import Combine

class FantasyHomeScreenViewModel:ObservableObject {
    
    private var cancellables = Set<AnyCancellable>()
    
    @Published var upcomingMatches: FantasyHomeScreenServiceResponseModel? = nil
    
     func getUpcomingMatches() {
         let fantasyHomeRouter = FantasyHomeRouter(endpoint: .upcomingMatches("10"))
//        loginRoute.setBody(LoginRequest(emailTo: email))
        
        NetworkManager.shared.request(route: fantasyHomeRouter, responseType: BaseResponse<FantasyHomeScreenServiceResponseModel>.self)
            .receive(on: DispatchQueue.main) // Ensure updates happen on the main thread
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Request completed successfully.")
                case .failure(let error):
                    print("Request failed with error: \(error)")
                    
//                    self.showAlert = true
                    
                }
            }, receiveValue: { [weak self] response in
                print("Token: \(response.message)")
                self?.upcomingMatches = response.data
//                self?.loginResponse = response
//                self?.navigateToOTP.toggle()
            })
            .store(in: &cancellables)
    }
}
