//
//  TravelDataEmergencyContactCell.swift
//  Trible_New
//
//  Created by Daniel on 2018/12/18.
//  Copyright © 2018年 Daniel. All rights reserved.
//

import UIKit

class TravelDataEmergencyContactCell: UITableViewCell {

    @IBOutlet private weak var phoneTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}

extension TravelDataEmergencyContactCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
