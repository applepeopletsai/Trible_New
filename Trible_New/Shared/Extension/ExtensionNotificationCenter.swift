//
//  ExtensionNotificationCenter.swift
//  Trible_New
//
//  Created by Daniel on 2019/4/29.
//  Copyright © 2019 Daniel. All rights reserved.
//

import Foundation

extension NotificationCenter: Notifier {
    enum NotificationName: String {
        case NetworkDidRecover
        case ApplicationDidBecomeActive
    }
}

protocol Notifier {
    associatedtype NotificationName: RawRepresentable
}

extension Notifier where Self.NotificationName.RawValue == String {
    static func addObserver(_ observer: Any, selector: Selector, notification: NotificationName, object: Any? = nil) {
        let aName = notification.rawValue
        NotificationCenter.default.addObserver(observer, selector: selector, name: NSNotification.Name(rawValue: aName), object: object)
    }
    static func postNotification(_ notification: NotificationName, object: Any? = nil, userInfo: [String : Any]? = nil) {
        let aName = notification.rawValue
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: aName), object: object, userInfo: userInfo)
    }
    static func removeObserver(_ observer: Any, notification: NotificationName, object: Any? = nil) {
        let aName = notification.rawValue
        NotificationCenter.default.removeObserver(observer, name: NSNotification.Name(rawValue: aName), object: object)
    }
}
