//
//  MemberModels.swift
//  Trible_New
//
//  Created by Daniel on 2019/4/29.
//  Copyright © 2019 Daniel. All rights reserved.
//

import Foundation

enum MemberItemValueType: Int {
    case UserName = 1
    case UserPicture = 2
    case NickName = 4
    case Email = 8
    case Phone = 16
    case EmailConfirmCode = 32
    case PhoneConfirmCode = 64
    case EmailConfirmation = 128
    case PhoneConfirmaion = 256
    case UserConfirmation = 512
}

enum CountryType: Int, Codable {
    case NotDetermine = 0
    case Taiwan = 1
    case HongKong = 2
    case Japan = 4
    case Korea = 8
}

enum ReceiptType: Int, Codable {
    case Paypal = 1
    case Bank = 2
}

enum CurrencyType: Int, Codable {
    case USD = 1
}

struct MemberSettingModel: Codable {
    var MemberId: String?
    var MessageFromUsers: Bool
    var MessageFromUpdates: Bool
    var MessageFromOrders: Bool
    var EmailFromTrible: Bool
    var EmailFromOrders: Bool
    var PhoneFromTrible: Bool
}

struct MemberReceiptAccountModel: Codable {
    var Id: String
    var MemberId: String?
    var BranchCode: String?
    var Default: Bool
    var CountryType: CountryType
    var ReceiptType: ReceiptType
    var CurrencyType: CurrencyType
}
