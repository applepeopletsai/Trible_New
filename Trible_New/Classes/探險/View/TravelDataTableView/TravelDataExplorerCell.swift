//
//  TravelDataExplorerCell.swift
//  Trible_New
//
//  Created by Daniel on 2018/12/18.
//  Copyright © 2018年 Daniel. All rights reserved.
//

import UIKit

class TravelDataExplorerCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}

extension TravelDataExplorerCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
