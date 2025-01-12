//
//  RazorPaySDKmanager.swift
//  Pro11
//
//  Created by Ravi Ranjan on 12/01/25.
//

import Foundation
import Razorpay

//final class RazorpayManager: NSObject, RazorpayPaymentCompletionProtocol {
//    private var razorpay: RazorpayCheckout
//    private var apiKey: String
//    private var onPaymentSuccess: ((String) -> Void)?
//    private var onPaymentError: ((Int, String) -> Void)?
//
//    init(apiKey: String) {
//        self.apiKey = apiKey
//        self.razorpay = RazorpayCheckout.initWithKey("", andDelegate: .)
//        super.init()
//        self.razorpay = RazorpayCheckout.initWithKey(apiKey, andDelegate: self)
//    }
//
//    func startPayment(amount: Int, currency: String = "INR", onSuccess: @escaping (String) -> Void, onError: @escaping (Int, String) -> Void) {
//        self.onPaymentSuccess = onSuccess
//        self.onPaymentError = onError
//        
//        let options: [String: Any] = [
//            "amount": amount * 100, // Amount in paise (1 INR = 100 paise)
//            "currency": currency,
//            "description": "Purchase Description",
//            "prefill": [
//                "contact": "1234567890",
//                "email": "test@example.com"
//            ]
//        ]
//
//        DispatchQueue.main.async {
//            self.razorpay.open(options)
//        }
//    }
//
//    func onPaymentSuccess(_ payment_id: String) {
//        onPaymentSuccess?(payment_id)
//    }
//
//    func onPaymentError(_ code: Int32, description: String) {
//        onPaymentError?(Int(code), description)
//    }
//}
