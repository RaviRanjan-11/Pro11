//
//  OTPScreenViewModel.swift
//  Pro11
//
//  Created by Ravi Ranjan on 23/12/24.
//

import Foundation
import SwiftUI
import Combine

/// A view model for the OTP verification screen.
///
/// This class handles the OTP submission, timer management, and navigation logic.
class OTPScreenViewModel: ObservableObject {

    
    typealias OTPResponseAlias = BaseResponse<OTPResponse>

    // MARK: - Published Properties

    /// The OTP entered by the user.
    @Published var otp: String = ""

    /// The countdown timer value in seconds.
    @Published var timerCount: Int = 45

    /// Indicates whether the resend OTP button is active.
    @Published var isResendActive: Bool = false

    /// A flag to navigate to the home screen upon successful OTP verification.
    @Published var navigateToHomeScreen: Bool = false

    /// Indicates whether a network request is in progress.
    @Published var isLoading: Bool = false

    // MARK: - Private Properties

    /// The email address of the user.
    var email: String

    /// The session token for OTP verification.
    private var token: String

    /// A timer to handle the countdown for OTP resending.
    private var timer: Timer?

    /// A set to store Combine subscriptions.
    private var cancellables = Set<AnyCancellable>()
    
    @Published var hasError: Bool = false

    // MARK: - Initializer

    /// Initializes the view model with the user's email and session token.
    ///
    /// - Parameters:
    ///   - email: The user's email address.
    ///   - token: The session token for OTP verification.
    init(email: String, token: String) {
        self.email = email
        self.token = token
    }

    // MARK: - Timer Management

    /// Starts the countdown timer for OTP resending.
    func startTimer() {
        resetTimer()
    }
    
    /// Resets the timer to its initial state.
    func resetTimer() {
        timerCount = 45
        isResendActive = false
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerTick), userInfo: nil, repeats: true)
    }
    
    /// Handles each tick of the timer.
    @objc private func timerTick() {
        if timerCount > 0 {
            timerCount -= 1
        } else {
            timer?.invalidate()
            isResendActive = true
        }
    }

    // MARK: - OTP Submission

    /// Submits the OTP for verification.
    func submitOTP() {
        guard isOTPValid else {
            print("Invalid OTP")
            self.hasError = true
            return
        }
        
        isLoading = true
        let request = OTPServiceRequestModel(username: email, otp: otp, token: token)
        let otpRoute = OTPRoute()
        otpRoute.body = request

        NetworkManager.shared.request(route: otpRoute, responseType: OTPResponseAlias.self)
            .sink(receiveCompletion: handleRequestCompletion, receiveValue: handleRequestSuccess)
            .store(in: &cancellables)
    }

    /// Validates the OTP entered by the user.
    private var isOTPValid: Bool {
        return !otp.isEmpty && otp.count == 6
    }

    // MARK: - Network Response Handling

    /// Handles the completion of the network request.
    ///
    /// - Parameter completion: The completion state of the request.
    private func handleRequestCompletion(completion: Subscribers.Completion<NetworkError>) {
        DispatchQueue.main.async {
            self.isLoading = false
            switch completion {
            case .finished:
                print("Request completed successfully.")
            case .failure(let error):
                self.hasError = true
                print("Request failed with error: \(error.localizedDescription)")
            }
        }
    }

    /// Handles a successful OTP verification response.
    ///
    /// - Parameter response: The response containing the OTP verification result.
    private func handleRequestSuccess(response: OTPResponseAlias) {
        DispatchQueue.main.async {
            self.isLoading = false
            print("Message: \(response.message)")
            guard let data = response.data else { return }
            self.storeSessionData(data.accessToken, data.user.userID.toString, data.user.username)
            self.navigateToHomeScreen.toggle()
        }
        
    }

    // MARK: - Token Management

    /// Stores the session token upon successful OTP verification.
    ///
    /// - Parameter token: The access token to store.
    private func storeSessionData(_ token: String, _ userId: String, _ userName: String) {
        UserStorage.token = token
        UserStorage.userId = userId
        UserStorage.isLoggedIn = true
    }

    // MARK: - Timer Cleanup

    /// Stops the timer.
    func stopTimer() {
        timer?.invalidate()
    }
    
    // MARK: - Deinitialization

    /// Cleans up resources when the view model is deallocated.
    deinit {
        stopTimer()
        cancellables.removeAll()
    }
}


