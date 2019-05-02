//
//  SelectPeopleCountViewController.swift
//  Trible_New
//
//  Created by Daniel on 2018/11/20.
//  Copyright © 2018年 Daniel. All rights reserved.
//

import UIKit

typealias selectPeopleCountHandlr = (_ count: Int) -> Void

class SelectPeopleCountViewController: BaseViewController {

    @IBOutlet private weak var countLabel: UILabel!
    
    private var cancelAction: actionHandler?
    private var confirmAction: selectPeopleCountHandlr?
    
    private var count = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: Event Handler
    @IBAction private func increaseButtonPress(_ sender: UIButton) {
        if count >= 50 { return }
        count += 1
        self.countLabel.text = String(count)
    }
    
    @IBAction private func decreaseButtonPress(_ sender: UIButton) {
        if count <= 1 { return }
        count -= 1
        self.countLabel.text = String(count)
    }
    
    @IBAction private func cancelButtonPress(_ sender: UIButton) {
        cancelAction?()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction private func confirmButtonPress(_ sender: UIButton) {
        confirmAction?(count)
        self.dismiss(animated: true, completion: nil)
    }
}
