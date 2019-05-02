//
//  Step2_4ViewController.swift
//  Trible_New
//
//  Created by Daniel on 2019/1/14.
//  Copyright © 2019年 Daniel. All rights reserved.
//

import UIKit

class Step2_4ViewController: BaseViewController {

    @IBOutlet private weak var inputBoxTableView: InputBoxTableView!
    @IBOutlet private weak var inputBoxTableViewHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputBoxTableView.configureTableViewWith(inputTextArray: [""], delegate: self)
    }
}

extension Step2_4ViewController: InputBoxTableViewDelegate {
    func didUpdateInputTextArray(array: [String]) {
        inputBoxTableViewHeight.constant = CGFloat(array.count * 50)
    }
}
