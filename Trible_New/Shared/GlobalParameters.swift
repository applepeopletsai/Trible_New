//
//  GlobalParameters.swift
//  Trible_New
//
//  Created by Daniel on 2018/10/17.
//  Copyright © 2018年 Daniel. All rights reserved.
//

import UIKit

typealias actionHandler = (() -> Void)
typealias pickerConfirmHandler = (_ item: String, _ selectIndex: Int) -> Void

let screenSize = UIScreen.main.bounds.size
let screenWidth = screenSize.width
let screenHeight = screenSize.height
let statusBarHeight = UIApplication.shared.statusBarFrame.height

let kStoryBoard_Login = "Login"
let kStoryBoard_Experience = "Experience"
let kStoryBoard_Message = "Message"
let kStoryBoard_WishList = "WishList"
let kStoryBoard_Order = "Order"
let kStoryBoard_My = "My"
let kStoryBoard_CreateExperience = "CreateExperience"
let kStoryBoard_Shared = "Shared"

let kUserDefaultKey_token = "UserDefaultKey_token"

func safeArea() -> UIEdgeInsets {
    if #available(iOS 11, *) {
        return UIApplication.shared.keyWindow?.safeAreaInsets ?? UIEdgeInsets.zero
    } else {
        return UIEdgeInsets.zero
    }
}
