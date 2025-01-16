//
//  BalanceViewModel.swift
//  Pro11
//
//  Created by Ravi Ranjan on 11/01/25.
//

import Foundation
import Combine
class BalanceViewModel: ObservableObject {
    
    private var cancellables = Set<AnyCancellable>()
    
    var balanceResponse: BalanceResponseModel?
    
   
    func fetchBalance() {
        
        let router = BalanceRoute(endpoint: .getBalance(UserId: UserStorage.userId))
        
        NetworkManager.shared.request(route: router, responseType: BaseResponse<BalanceResponseModel>.self)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Request completed successfully.")
                case .failure(let error):
                    print("Request failed with error: \(error)")
                }
            }, receiveValue: { [weak self] response in
                self?.balanceResponse = response.data
                let walletid = response.data?.id.toString ?? ""
                UserStorage.walletId = walletid

            })
            .store(in: &cancellables)
    }
    
    func createOrderForWallet(with amount: String) {
        let router = BalanceRoute(endpoint: .createOrder(UserId: UserStorage.walletId))
        let body: CreateBalanceOrderRequestModel = CreateBalanceOrderRequestModel(amount: amount)
        router.body = body
        NetworkManager.shared.request(route: router, responseType: BaseResponse<CreateOrderResponseModel>.self)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Request completed successfully.")
                case .failure(let error):
                    print("Request failed with error: \(error)")
                }
            }, receiveValue: { [weak self] response in
                print(response)
            })
            .store(in: &cancellables)
    }
}

        
