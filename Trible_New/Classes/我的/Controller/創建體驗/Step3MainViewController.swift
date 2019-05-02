//
//  Step3MainViewController.swift
//  Trible_New
//
//  Created by Daniel on 2019/1/15.
//  Copyright © 2019年 Daniel. All rights reserved.
//

import UIKit

class Step3MainViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: Event Handler
    @IBAction private func step3_1ButtonPress(_ sender: UIButton) {
        let vc = UIStoryboard(name: kStoryBoard_CreateExperience, bundle: nil).instantiateViewController(withIdentifier: String(describing: Step3_1ViewController.self)) as! Step3_1ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction private func step3_2ButtonPress(_ sender: UIButton) {
        let vc = UIStoryboard(name: kStoryBoard_CreateExperience, bundle: nil).instantiateViewController(withIdentifier: String(describing: Step3_2ViewController.self)) as! Step3_2ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction private func step3_3ButtonPress(_ sender: UIButton) {
        let vc = UIStoryboard(name: kStoryBoard_CreateExperience, bundle: nil).instantiateViewController(withIdentifier: String(describing: Step3_3ViewController.self)) as! Step3_3ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
