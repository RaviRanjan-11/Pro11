//
//  LoginViewModel.swift
//  Pro11
//
//  Created by Ravi Ranjan on 21/12/24.
//

import Foundation
import Combine


/// A ViewModel for managing the login process and handling user interactions in the login screen.
class LoginViewModel: ObservableObject {
    
    // MARK: - Published Properties
    
    /// User's email address input.
    @Published var email: String = ""
    
    /// Indicates whether the user confirms being above 18 years old.
    @Published var isAbove18: Bool = false
    
    /// Indicates whether to show an alert for validation errors.
    @Published var showAlert: Bool = false
    
    /// Controls navigation to the OTP screen upon successful OTP request.
    @Published var navigateToOTP: Bool = false
    
    // MARK: - Private Properties
    
    /// Stores the response from the login API request.
    var loginResponse: BaseResponse<LoginData>?
    
    /// A set of Combine cancellables to manage memory for publishers.
    private var cancellables = Set<AnyCancellable>()
    
    
    // MARK: - Computed Properties
    
    /// Extracts the authentication token from the login response, if available.
    var token: String? {
        loginResponse?.data?.token
    }
    
    /// Determines whether the submit button should be disabled based on form validation.
    var isSubmitButtonDisabled: Bool {
        return email.isEmpty || !isAbove18 || !email.isvalidEmail
    }
    
    
    // MARK: - Methods
    
    /// Validates the form fields before submission.
    /// - Returns: A Boolean indicating whether the form is valid.
    func validateForm() -> Bool {
        if email.isEmpty || !isAbove18 {
            showAlert = true
            return false
        }
        return true
    }
    
    /// Initiates the OTP request process.
    /// This method first validates the form and then sends the OTP request if the form is valid.
    func requestOTP() {
        print("Request OTP")
        sendOTP()
    }
    
    /// Sends an OTP request to the server.
    ///
    /// Uses the `NetworkManager` to make an API call to the login route. Handles the response and manages state accordingly.
    private func sendOTP() {
        let loginRoute = LoginRoute(endpoint: .otp)
        loginRoute.setBody(LoginRequest(emailTo: email))
        
        NetworkManager.shared.request(route: loginRoute, responseType: BaseResponse<LoginData>.self)
            .receive(on: DispatchQueue.main) // Ensure updates happen on the main thread
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Request completed successfully.")
                case .failure(let error):
                    print("Request failed with error: \(error)")
                    
                    self.showAlert = true
                    
                }
            }, receiveValue: { [weak self] response in
                print("Token: \(response.message)")
                self?.loginResponse = response
                self?.navigateToOTP.toggle()
            })
            .store(in: &cancellables)
    }
}


