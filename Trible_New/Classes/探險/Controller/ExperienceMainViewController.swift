//
//  ExperienceMainViewController.swift
//  Trible_New
//
//  Created by Daniel on 2018/10/17.
//  Copyright © 2018年 Daniel. All rights reserved.
//

import UIKit

class ExperienceMainViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension ExperienceMainViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
