//
//  Step3_3ViewController.swift
//  Trible_New
//
//  Created by Daniel on 2019/1/15.
//  Copyright © 2019年 Daniel. All rights reserved.
//

import UIKit

class Step3_3ViewController: BaseViewController {

    @IBOutlet private weak var bottomLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        let action: actionHandler = {
            print("活動內容")
        }
        self.bottomLabel.addUnderLineWith(labelText: LocalizedString("Lang_CE_056"), textArray: [LocalizedString("Lang_CE_057")], colorArray: [color_31D0C1], actionArray: [action])
    }

}
