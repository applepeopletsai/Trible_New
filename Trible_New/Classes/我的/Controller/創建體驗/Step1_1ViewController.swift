//
//  Step1_1ViewController.swift
//  Trible_New
//
//  Created by Daniel on 2019/1/3.
//  Copyright © 2019年 Daniel. All rights reserved.
//

import UIKit

class Step1_1ViewController: BaseViewController {

    @IBOutlet private weak var classLabel: IBInspectableLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction private func selectClassButtonPress(_ sender: UIButton) {
        
    }
}

extension Step1_1ViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let totalString = (textView.text as NSString?)?.replacingCharacters(in: range, with: text)
        return ((totalString?.count ?? 0) < 150)
    }
}
