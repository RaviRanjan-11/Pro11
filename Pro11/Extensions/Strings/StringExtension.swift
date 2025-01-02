//
//  StringExtension.swift
//  Pro11
//
//  Created by Ravi Ranjan on 23/12/24.
//

import Foundation

extension String {
    var  isvalidEmail : Bool {
        let emailRegEx = "(?:[A-Z0-9a-z]+(?:[._%+-]?[A-Z0-9a-z]+)*@(?:[A-Za-z0-9-]+\\.)+[A-Za-z]{2,})"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    

    
    var isValidMobileNumber: Bool {
        let phoneRegEx = "^[0-9]{10}$"
        return NSPredicate(format: "SELF MATCHES %@", phoneRegEx).evaluate(with: self)
    }
}
