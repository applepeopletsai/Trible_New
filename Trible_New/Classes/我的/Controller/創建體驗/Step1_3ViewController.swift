//
//  Step1_3ViewController.swift
//  Trible_New
//
//  Created by Daniel on 2019/1/9.
//  Copyright © 2019年 Daniel. All rights reserved.
//

import UIKit

class Step1_3ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension Step1_3ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
