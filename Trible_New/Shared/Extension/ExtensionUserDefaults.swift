//
//  ExtensionUserDefaults.swift
//  Trible_New
//
//  Created by Daniel on 2019/4/29.
//  Copyright © 2019 Daniel. All rights reserved.
//

import Foundation

extension UserDefaults {
    struct UserInfo: UserDefaultsSettable {
        enum defaultKeys: String {
            case token
        }
    }
}

protocol UserDefaultsSettable {
    associatedtype defaultKeys: RawRepresentable
}

extension UserDefaultsSettable where Self.defaultKeys.RawValue == String {
    static func set(value: String?, forKey key: defaultKeys) {
        let aKey = key.rawValue
        UserDefaults.standard.set(value, forKey: aKey)
    }
    static func string(forKey key: defaultKeys) -> String? {
        let aKey = key.rawValue
        return UserDefaults.standard.string(forKey: aKey)
    }
}
