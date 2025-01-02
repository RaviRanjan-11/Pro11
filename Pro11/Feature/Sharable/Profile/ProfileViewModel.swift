//
//  ProfileViewModel.swift
//  Pro11
//
//  Created by Ravi Ranjan on 24/12/24.
//

import Foundation
import Combine

class ProfileViewModel: ObservableObject {
    // Combine publisher to notify logout status
    let logoutPublisher = PassthroughSubject<Bool, Never>()
    
    private var cancellables: Set<AnyCancellable> = []
    
    /// Logout the user
    func logout() {
    
        let profileRoute = ProfileRoute()
        // Perform the network request
        NetworkManager.shared
            .request(route: profileRoute, responseType: ProfileServiceModel.LogoutResponseModel.self)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .failure(let error):
                    print("Logout failed with error: \(error.localizedDescription)")
                    self?.logoutPublisher.send(false) // Notify failure
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] data in
                // Check the response for success
                if data.success {
                    print("Logout successful: \(data.message)")
                    self?.handleLogoutSuccess()
                    self?.logoutPublisher.send(true)
                } else {
                    print("Logout failed: \(data.message)")
                    self?.logoutPublisher.send(false)
                }
            })
            .store(in: &cancellables) // Store subscription
    }
    
    /// Handle logout success actions
    private func handleLogoutSuccess() {
        UserStorage.clearToken()
        print("User token cleared and logout cleanup completed.")
    }
}
