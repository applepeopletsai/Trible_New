//
//  LoginViewController.swift
//  Trible_New
//
//  Created by Daniel on 2018/10/22.
//  Copyright © 2018年 Daniel. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

    @IBOutlet private weak var accountTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var forgetPsdButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: Method
    private func configureUI() {
        self.forgetPsdButton.setTitle(LocalizedString("Lang_LG_009") + "? >", for: .normal)
    }
    
    // MARK: Event Handler
    @IBAction private func loginButtonPress(_ sender: UIButton) {
//        if (accountTextField.text?.count ?? 0) == 0 ||
//           (passwordTextField.text?.count ?? 0) == 0 {
//            return
//        }
        
        LoginService.login(userName: "afriend2301@hotmail.com", password: "a23019840", completion: {
            [weak self] in
            let naviVC = UINavigationController(rootViewController: CustomTabBarController())
            naviVC.isNavigationBarHidden = true
            self?.present(naviVC, animated: true, completion: nil)
        })
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
