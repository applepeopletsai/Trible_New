//
//  InputBoxCell.swift
//  Trible_New
//
//  Created by Daniel on 2019/1/16.
//  Copyright © 2019年 Daniel. All rights reserved.
//

import UIKit

protocol InputBoxCellDelegate: class {
    func rightButtonPressAtIndexPath(_ indexPath: IndexPath)
    func didChangeInputText(atIndexPath indexPath: IndexPath, withText text: String)
}

class InputBoxCell: UITableViewCell {

    @IBOutlet private weak var rightButton: UIButton!
    @IBOutlet private weak var inputTextField: IBInspectableTextField!
    
    private var indexPath: IndexPath?
    private weak var delegate: InputBoxCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCellWith(inputText: String, indexPath: IndexPath, type: InputBoxTableViewType, delegate: InputBoxCellDelegate) {
        self.delegate = delegate
        self.indexPath = indexPath
        self.inputTextField.text = inputText
        
        switch type {
        case .ExperienceFeatures:
            self.inputTextField.placeHolderLocolizedKey = "Lang_CE_037"
            break
        case .ReminderExplorer:
            self.inputTextField.placeHolderLocolizedKey = "Lang_CE_038"
            break
        case .CostInvolve:
            self.inputTextField.placeHolderLocolizedKey = "Lang_CE_050"
            break
        }
        
        if indexPath.row == 0 {
            self.rightButton.setImage(UIImage(named: "btn_add_green"), for: .normal)
        } else {
            self.rightButton.setImage(UIImage(named: "btn_remove_red"), for: .normal)
        }
    }
    
    // MARK: Event Handler
    @IBAction private func rightButtonPress(_ sender: UIButton) {
        if let indexPath = indexPath {
            self.delegate?.rightButtonPressAtIndexPath(indexPath)
        }
    }
    
    @IBAction func inputTextDidChanged(_ sender: UITextField) {
        if let indexPath = indexPath {
            self.delegate?.didChangeInputText(atIndexPath: indexPath, withText: sender.text ?? "")
        }
    }
}

extension InputBoxCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

