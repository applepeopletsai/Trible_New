//
//  FBService.swift
//  Trible_New
//
//  Created by Daniel on 2019/4/29.
//  Copyright © 2019 Daniel. All rights reserved.
//

import Foundation
import FBSDKLoginKit

class FBService {
    private static let sharedInstance = FBService()
    
    private var userId: String?
    private var userName: String?
    private var email: String?
    private var imageUrl: String?
    
    static func loginWith(success: actionHandler?, failure: actionHandler?) {
        if checkAccessToken() {
            FBService.getFbProfileWith(success: success, failure: failure)
        } else {
            FBSDKLoginManager().logIn(withReadPermissions: ["public_profile", "email", "user_friends"], from: SystemManager.topViewController(), handler: { (result, error) in
                if error != nil {
                    SystemManager.showAlertWith(alertTitle: "FB登入失敗", alertMessage: error?.localizedDescription ?? "未知原因", buttonTitle: "好", handler: {
                        failure?()
                    })
                    return
                }
                FBService.getFbProfileWith(success: success, failure: failure)
            })
        }
    }
    
    static func logout() {
        FBSDKLoginManager().logOut()
    }
    
    static func getUserId() -> String {
        return FBService.sharedInstance.userId ?? ""
    }
    
    static func getUserName() -> String {
        return FBService.sharedInstance.userName ?? ""
    }
    
    static func getEmail() -> String {
        return FBService.sharedInstance.email ?? ""
    }
    
    static func getPictureUrl() -> String? {
        return FBService.sharedInstance.imageUrl
    }
    
    private static func getFbProfileWith(success: actionHandler?, failure: actionHandler?) {
        // 需要取得的資訊種類
        let parameters = ["fields": "id, first_name, last_name, name, email, picture.type(large), link, birthday"]
        FBSDKGraphRequest(graphPath: "me", parameters: parameters).start(completionHandler: {
            connection, result, error -> Void in
            if error != nil {
                SystemManager.showAlertWith(alertTitle: "取得FB資訊失敗", alertMessage: error?.localizedDescription ?? "未知原因", buttonTitle: "好", handler: {
                    failure?()
                })
                return
            }
            if let dataDic = result as? [String:Any] {
                FBService.sharedInstance.userId = dataDic["id"] as? String
                FBService.sharedInstance.userName = dataDic["name"] as? String
                FBService.sharedInstance.email = dataDic["email"] as? String
                
                if let picture = dataDic["picture"] as? NSDictionary, let data = picture["data"] as? NSDictionary, let url = data["url"] as? String {
                    FBService.sharedInstance.imageUrl = url
                }
            }
            success?()
        })
    }
    
    private static func checkAccessToken() -> Bool {
        return FBSDKAccessToken.current() != nil
    }
}
