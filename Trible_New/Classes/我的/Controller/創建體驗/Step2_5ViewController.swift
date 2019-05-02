//
//  Step2_5ViewController.swift
//  Trible_New
//
//  Created by Daniel on 2019/1/14.
//  Copyright © 2019年 Daniel. All rights reserved.
//

import UIKit

class Step2_5ViewController: BaseViewController {

    @IBOutlet private weak var inputBoxTableView: InputBoxTableView!
    @IBOutlet private weak var reminderExplorerViewHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputBoxTableView.configureTableViewWith(inputTextArray: [""], delegate: self)
    }

}

extension Step2_5ViewController: InputBoxTableViewDelegate {
    func didUpdateInputTextArray(array: [String]) {
        reminderExplorerViewHeight.constant = 40 + 5 + CGFloat(array.count * 50) + 15
    }
}
