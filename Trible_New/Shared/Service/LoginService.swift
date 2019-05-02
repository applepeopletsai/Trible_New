//
//  LoginService.swift
//  Trible_New
//
//  Created by Daniel on 2019/4/29.
//  Copyright © 2019 Daniel. All rights reserved.
//

import Foundation

class LoginService {
    static func login(userName: String? = nil, password: String? = nil, providerKey: String? = nil, loginProviderKey: String? = nil, completion: @escaping actionHandler) {
        if SystemManager.isNetworkReachable() {
            SystemManager.showLoading()
            
            AuthenticationManager.apiGetAPIToken(userName: userName, password: password, providerKey: providerKey, loginProviderKey: loginProviderKey, success: { (model) in
                if model?.HttpStatusCode == 200 {
                    SystemManager.hideLoading()
                    completion()
                } else {
                    SystemManager.endLoadingWith(model: model)
                }
            }, failure: { (error) in
                SystemManager.showErrorAlert(error: error)
            })
        }
    }
}
