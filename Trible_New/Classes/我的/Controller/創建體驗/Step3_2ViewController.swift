//
//  Step3_2ViewController.swift
//  Trible_New
//
//  Created by Daniel on 2019/1/15.
//  Copyright © 2019年 Daniel. All rights reserved.
//

import UIKit

class Step3_2ViewController: BaseViewController {

    @IBOutlet private weak var otherPlanTableView: OtherPlanTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func increasePlanButton() {
        self.otherPlanTableView.increasePlan()
        
        print(otherPlanTableView.data())
    }

}
