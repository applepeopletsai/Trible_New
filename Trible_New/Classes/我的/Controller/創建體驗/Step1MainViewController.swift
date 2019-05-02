//
//  Step1MainViewController.swift
//  Trible_New
//
//  Created by Daniel on 2019/1/3.
//  Copyright © 2019年 Daniel. All rights reserved.
//

import UIKit

class Step1MainViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: Event Handler
    @IBAction private func step1_1ButtonPress(_ sender: UIButton) {
        let vc = UIStoryboard(name: kStoryBoard_CreateExperience, bundle: nil).instantiateViewController(withIdentifier: String(describing: Step1_1ViewController.self)) as! Step1_1ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction private func step1_2ButtonPress(_ sender: UIButton) {
        let vc = UIStoryboard(name: kStoryBoard_CreateExperience, bundle: nil).instantiateViewController(withIdentifier: String(describing: Step1_2ViewController.self)) as! Step1_2ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction private func step1_3ButtonPress(_ sender: UIButton) {
        let vc = UIStoryboard(name: kStoryBoard_CreateExperience, bundle: nil).instantiateViewController(withIdentifier: String(describing: Step1_3ViewController.self)) as! Step1_3ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
