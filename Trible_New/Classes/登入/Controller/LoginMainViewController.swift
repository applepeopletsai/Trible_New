//
//  LoginMainViewController.swift
//  Trible_New
//
//  Created by Daniel on 2018/11/13.
//  Copyright © 2018年 Daniel. All rights reserved.
//

import UIKit

class LoginMainViewController: BaseViewController {

    @IBOutlet private weak var bottomLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBottomLabel()
    }
    
    // MARK: Method
    private func setupBottomLabel() {
        let action1: actionHandler = {
            print(LocalizedString("Lang_LG_010"))
        }
        let action2: actionHandler = {
            print(LocalizedString("Lang_LG_011"))
        }
        
        self.bottomLabel.addUnderLineWith(labelText: LocalizedString("Lang_LG_001"), textArray: [LocalizedString("Lang_LG_010"),LocalizedString("Lang_LG_011")], colorArray: [color_4A90E2], actionArray: [action1,action2])
    }
    
    private func loginSuccessHandler() {
        let naviVC = UINavigationController(rootViewController: CustomTabBarController())
        naviVC.isNavigationBarHidden = true
        self.present(naviVC, animated: true, completion: nil)
    }
    
    // MARK: Event Handler
    @IBAction private func fbButtonPress() {
        FBService.loginWith(success: {
            LoginService.login(providerKey: "FB", loginProviderKey: FBService.getUserId().sha256, completion: {
                [weak self] in
                let naviVC = UINavigationController(rootViewController: CustomTabBarController())
                naviVC.isNavigationBarHidden = true
                self?.present(naviVC, animated: true, completion: nil)
            })
        }, failure: nil)
    }
    
    @IBAction private func googoleButtonPress() {
        SystemManager.showLoading()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            SystemManager.hideLoading()
        })
    }
    
    @IBAction private func registerButtonPress() {
        let vc = UIStoryboard(name: kStoryBoard_Login, bundle: nil).instantiateViewController(withIdentifier: String(describing: RegisterViewController.self)) as! RegisterViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction private func loginButtonPress() {
        let vc = UIStoryboard(name: kStoryBoard_Login, bundle: nil).instantiateViewController(withIdentifier: String(describing: LoginViewController.self)) as! LoginViewController
        self.present(vc, animated: true, completion: nil)
    }
}
