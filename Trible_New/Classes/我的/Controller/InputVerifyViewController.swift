//
//  InputVerifyViewController.swift
//  Trible_New
//
//  Created by Daniel on 2019/4/11.
//  Copyright © 2019 Daniel. All rights reserved.
//

import UIKit

class InputVerifyViewController: BaseViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var inputTextField: IBInspectableTextField!
    
    private var verifyType: DataVerifyButtonType?
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    // MARK: Pubilc Init Method
    func setupWithType(type: DataVerifyButtonType) {
        self.verifyType = type
    }
    
    // MARK: Private Method
    private func initialize() {
        guard let type = self.verifyType else { return }
        
        switch type {
        case .Email:
            self.titleLabel.text = LocalizedString("Lang_MY_005")
            self.inputTextField.placeHolderLocolizedKey = "Lang_MY_011"
            break
        case .Phone:
            self.titleLabel.text = LocalizedString("Lang_MY_006")
            self.inputTextField.placeHolderLocolizedKey = "Lang_MY_012"
            break
        default:
            break
        }
    }
}
