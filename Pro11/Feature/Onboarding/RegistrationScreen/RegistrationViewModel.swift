//
//  RegistrationViewModel.swift
//  Pro11
//
//  Created by Ravi Ranjan on 24/12/24.
//

import Foundation
import Combine


enum AlertType {
    case success(String)
    case error(String)
    case none
    
   var message: String {
        switch self {
        case .success(let message):
            return message
        case .error(let message):
            return message
        case .none:
            return ""
        }
    }
    
    var type:String {
        switch self {
        case .success:
            return "Success"
        case .error:
            return "Error"
        case .none:
            return ""
        }
    }
}

enum RegistrationType {
    case normal
    case referral
    
}

class RegistrationViewModel: ObservableObject {
    // Published properties to bind with the view
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var mobile: String = ""
    @Published var referralCode: String = ""
    @Published var isAbove18: Bool = false
    @Published var showAlert: Bool = false
    @Published var alert: AlertType = .none
    @Published var registrationType: RegistrationType = .normal
    var isSuccess: Bool = false
    
    /// A set of Combine cancellables to manage memory for publishers.
    private var cancellables = Set<AnyCancellable>()

    
    // Combine publisher to validate form submission
    var isFormValid: Bool {
        return !email.isEmpty && isAbove18
    }
    
    // Function to handle submission
    func submitRegistration() {
        if name.isEmpty || email.isEmpty || mobile.isEmpty || !isAbove18 {
            alert = .error("Please fill all required fields and confirm you're above 18.")
            showAlert = true
        } else if !email.isvalidEmail {
            alert = .error("Please enter a valid email address.")
            showAlert = true
        } else if !mobile.isValidMobileNumber {
            alert = .error("Please enter a valid phone number.")
            showAlert = true
        } else {
            // Perform the registration logic here
            register()
        }
    }
    
    // Private method to initiate the registration API call
    private func register() {
        
        let registrationType: RegistrationRoute.RegistrationEndpoint = referralCode.isEmpty ? .normal : .referral
        
        // Create the registration request model
        let registrationRequest = RegistrationServiceRequestModel(
            username: name,
            email: email,
            phoneNo: "+91" + mobile,
            acceptedTermsAndConditions: "true",
            referralCode: referralCode.isEmpty ? nil : referralCode
        )
        
        let registrationRoute = RegistrationRoute(endpoint: registrationType == .normal ? .normal : .referral)
        
        // Set the request body with the registration data
        registrationRoute.setBody(registrationRequest)
        
        // Send the registration request
        NetworkManager.shared.request(route: registrationRoute, responseType: BaseResponse<RegistrationServiceResponsetModel>.self) // Adjust response type as needed
            .receive(on: DispatchQueue.main) // Ensure updates happen on the main thread
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Request completed successfully.")
                case .failure(let error):
                    print("Request failed with error: \(error)")
                    self.alert = .error("Registration failed. Please try again.")
                    self.showAlert = true
                }
            }, receiveValue: { [weak self] response in
                print("Response: \(response.message)") // Handle the response appropriately
                self?.alert = .success(response.message)
                self?.isSuccess = true
                self?.showAlert = true
            })
            .store(in: &cancellables)
    }
}
