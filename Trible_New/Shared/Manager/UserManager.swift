//
//  UserManager.swift
//  Trible_New
//
//  Created by Daniel on 2019/4/11.
//  Copyright © 2019 Daniel. All rights reserved.
//

import Foundation

class UserManager: NSObject {
    
    static func saveUserToken(token: String) {
        UserDefaults.UserInfo.set(value: token, forKey: .token)
    }
    
    static func getUserToken() -> String {
        return UserDefaults.UserInfo.string(forKey: .token) ?? ""
    }
}
