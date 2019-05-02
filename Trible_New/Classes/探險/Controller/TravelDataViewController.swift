//
//  TravelDataViewController.swift
//  Trible_New
//
//  Created by Daniel on 2018/12/18.
//  Copyright © 2018年 Daniel. All rights reserved.
//

import UIKit

class TravelDataViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: Event Handler
    @IBAction private func finishButtonPress(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
