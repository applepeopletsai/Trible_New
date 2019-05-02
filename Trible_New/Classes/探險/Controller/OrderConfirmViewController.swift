//
//  OrderConfirmViewController.swift
//  Trible_New
//
//  Created by Daniel on 2018/12/14.
//  Copyright © 2018年 Daniel. All rights reserved.
//

import UIKit

class OrderConfirmViewController: BaseViewController {
    
    @IBOutlet private weak var phoneTextField: UITextField!
    @IBOutlet private weak var fillButton: IBInspectableButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }

    // MARK: Method
    private func initialize() {
        self.fillButton.setTitle("\(LocalizedString("Lang_RI_042"))>", for: .normal)
        self.fillButton.setImage(UIImage(named: "ic_edit"), for: .normal)
    }
    
    // Event Handler
    @IBAction private func fillInTravelDataButtonPress(_ sender: UIButton) {
        let vc = UIStoryboard(name: kStoryBoard_Experience, bundle: nil).instantiateViewController(withIdentifier: String(describing: TravelDataViewController.self)) as! TravelDataViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension OrderConfirmViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
