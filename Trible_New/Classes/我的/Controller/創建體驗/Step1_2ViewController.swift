//
//  Step1_2ViewController.swift
//  Trible_New
//
//  Created by Daniel on 2019/1/9.
//  Copyright © 2019年 Daniel. All rights reserved.
//

import UIKit

class Step1_2ViewController: BaseViewController {

    @IBOutlet private weak var countLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var inputBoxTableView: InputBoxTableView!
    @IBOutlet private weak var costInvolveViewHeight: NSLayoutConstraint!
    
    private var count = 1
    private var totalTime = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputBoxTableView.configureTableViewWith(inputTextArray: [""], delegate: self)
    }
    
    // MARK: Event Handler
    @IBAction private func increaseCountButtonPress(_ sender: UIButton) {
        if count >= 10 { return }
        count += 1
        self.countLabel.text = String(count)
    }
    
    @IBAction private func decreaseCountButtonPress(_ sender: UIButton) {
        if count <= 1 { return }
        count -= 1
        self.countLabel.text = String(count)
    }
    
    @IBAction private func increaseTimeButtonPress(_ sender: UIButton) {
        if totalTime >= 10 { return }
        totalTime += 1
        self.timeLabel.text = String(totalTime)
    }
    
    @IBAction private func decreaseTimeButtonPress(_ sender: UIButton) {
        if totalTime <= 1 { return }
        totalTime -= 1
        self.timeLabel.text = String(totalTime)
    }

}

extension Step1_2ViewController: InputBoxTableViewDelegate {
    func didUpdateInputTextArray(array: [String]) {
        self.costInvolveViewHeight.constant = 40 + CGFloat(array.count * 50) + 10
    }
}

extension Step1_2ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
