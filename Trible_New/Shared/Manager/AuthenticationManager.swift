//
//  AuthenticationManager.swift
//  Trible_New
//
//  Created by Daniel on 2019/1/23.
//  Copyright © 2019年 Daniel. All rights reserved.
//

import Foundation

class AuthenticationManager {
    
    /// [AUT_A_001] Get API Token - 使用者點擊登入按鈕後呼叫
    ///
    /// - Parameters:
    ///   - userName: 使用者帳號
    ///   - password: 密碼
    ///   - providerKey: 第三方登入的類別
    ///   - loginProviderKey: 第三方登入的id
    static func apiGetAPIToken(userName: String?,
                               password: String?,
                               providerKey: String?,
                               loginProviderKey: String?,
                               success: @escaping (_ response: BaseModel<String>?) -> Void,
                               failure: @escaping failureClosure) {
        var parameters = [String:Any]()
        
        if let userName = userName, let password = password {
            parameters["Username"] = userName
            parameters["Password"] = (password + "TribleIsAmazing").sha256
        }
        
        if let providerKey = providerKey, let loginProviderKey = loginProviderKey {
            parameters["ProviderKey"] = providerKey
            parameters["LoginProviderKey"] = loginProviderKey
        }
        
        if parameters.count == 0 {
            let e = NSError(domain: ApiUrl.Authentication.getToken, code: -9999, userInfo: ["NSLocalizedDescriptionKey":"The UserName and Password or ProviderKey and LoginProviderKey must be need"])
            failure(e)
            return
        }
        
        APIManager.sendPostRequestWith(parameters: parameters, path: ApiUrl.Authentication.getToken, success: { (response) in
            let result = APIManager.decode(response: response, type: BaseModel<String>.self)
            //存入token
            if let token = result?.Result {
                UserManager.saveUserToken(token: token)
            }
            success(result)
        }, failure: failure)
    }
}
