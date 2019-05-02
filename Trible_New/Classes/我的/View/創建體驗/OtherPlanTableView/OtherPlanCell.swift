//
//  OtherPlanCell.swift
//  Trible_New
//
//  Created by Daniel on 2019/1/16.
//  Copyright © 2019年 Daniel. All rights reserved.
//

import UIKit

protocol OtherPlanCellDelegate: class {
    func didDeletePress(atIndexPath indexPath: IndexPath)
    func didUpdatePlanName(atIndexPath indexPath: IndexPath, name: String)
    func didUpdatePlanDescription(atIndexPath indexPath: IndexPath, description: String)
    func didUpdatePeopleCount(atIndexPath indexPath: IndexPath, count: Int)
    func didUpdateCostInvolveArray(atIndexPath indexPath: IndexPath, costInVolveArray: [String])
}

class OtherPlanCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var planNameTextField: UITextField!
    @IBOutlet private weak var planDescriptionTextField: UITextField!
    @IBOutlet private weak var countLabel: UILabel!
    @IBOutlet private weak var inputBoxTableView: InputBoxTableView!
    
    private var indexPath: IndexPath?
    private weak var delegate: OtherPlanCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configureCellWith(model: OtherPlanModel, indexPath: IndexPath, delegate: OtherPlanCellDelegate) {
        self.indexPath = indexPath
        self.delegate = delegate
        self.titleLabel.text = "\(LocalizedString("Lang_CE_053"))\(indexPath.row + 1)"
        self.planNameTextField.text = model.planName
        self.planDescriptionTextField.text = model.planDes
        self.countLabel.text = String(model.peopleCount)
        self.inputBoxTableView.configureTableViewWith(inputTextArray: model.items, delegate: self)
    }
    
    // MARK: Event Handler
    @IBAction private func deleteButtonPress(_ sender: UIButton) {
        if let indexPath = indexPath {
            self.delegate?.didDeletePress(atIndexPath: indexPath)
        }
    }
    
    @IBAction private func planNameDidChanged(_ sender: UITextField) {
        if let indexPath = indexPath {
            self.delegate?.didUpdatePlanName(atIndexPath: indexPath, name: sender.text ?? "")
        }
    }
    
    @IBAction private func planDescriptionDidChanged(_ sender: UITextField) {
        if let indexPath = indexPath {
            self.delegate?.didUpdatePlanDescription(atIndexPath: indexPath, description: sender.text ?? "")
        }
    }
    
    @IBAction private func increaseButtonPress(_ sender: UIButton) {
        let count = Int(countLabel.text ?? "1") ?? 1
        if count >= 10 { return }
        self.countLabel.text = String(count + 1)
        if let indexPath = indexPath {
            self.delegate?.didUpdatePeopleCount(atIndexPath: indexPath, count: count + 1)
        }
    }
    
    @IBAction private func decreaseButtonPress(_ sender: UIButton) {
        let count = Int(countLabel.text ?? "1") ?? 1
        if count <= 1 { return }
        self.countLabel.text = String(count - 1)
        if let indexPath = indexPath {
            self.delegate?.didUpdatePeopleCount(atIndexPath: indexPath, count: count - 1)
        }
    }
}

extension OtherPlanCell: InputBoxTableViewDelegate {
    func didUpdateInputTextArray(array: [String]) {
        print(array)
        if let indexPath = indexPath {
            self.delegate?.didUpdateCostInvolveArray(atIndexPath: indexPath, costInVolveArray: array)
        }
    }
}

extension OtherPlanCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
