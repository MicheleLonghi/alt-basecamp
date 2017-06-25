//
//  BCModel.swift
//  alt-basecamp
//
//  Created by Michele Longhi on 25/06/17.
//  Copyright © 2017 Michele Longhi. All rights reserved.
//

import Foundation

class BCModel {
    
    static let shared = BCModel()
    
    static let accountId = "3581213"
    static let clientId = "e4238fe2cd2e0c1fa95042b6a880a5fd1a6f5b75"
    static let clientSecret = "d8f8fbcc9e5ea0f1ff852a05ff5e2a44b13e4cf8"
    
    var isAuthenticated: Bool {
        return authenticationToken != nil
    }
    
    var authenticationToken: String? {
        
        get {
            return UserDefaults.standard.value(forKey: "authenticationToken") as? String
        }
        
        set {
            if let token = newValue {
                UserDefaults.standard.set(token, forKey: "authenticationToken")
            } else {
                UserDefaults.standard.removeObject(forKey: "authenticationToken")
            }
            UserDefaults.standard.synchronize()
        }
    }
}
