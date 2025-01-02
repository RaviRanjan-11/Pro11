//
//  UserStorageWrapper.swift
//  Pro11
//
//  Created by Ravi Ranjan on 24/12/24.
//

import Foundation

@propertyWrapper
struct Storage<T> {
    let key: String
    let defaultValue: T

    init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}


