//
//  Step2_3ViewController.swift
//  Trible_New
//
//  Created by Daniel on 2019/1/14.
//  Copyright © 2019年 Daniel. All rights reserved.
//

import UIKit

class Step2_3ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension Step2_3ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
