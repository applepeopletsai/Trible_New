//
//  CreateExperienceMainViewController.swift
//  Trible_New
//
//  Created by Daniel on 2018/12/26.
//  Copyright © 2018年 Daniel. All rights reserved.
//

import UIKit

class CreateExperienceMainViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: Event Handler
    @IBAction private func step1ButtonPress(_ sender: UIButton) {
        let vc = UIStoryboard(name: kStoryBoard_CreateExperience, bundle: nil).instantiateViewController(withIdentifier: String(describing: Step1MainViewController.self)) as! Step1MainViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction private func step2ButtonPress(_ sender: UIButton) {
        let vc = UIStoryboard(name: kStoryBoard_CreateExperience, bundle: nil).instantiateViewController(withIdentifier: String(describing: Step2MainViewController.self)) as! Step2MainViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction private func step3ButtonPress(_ sender: UIButton) {
        let vc = UIStoryboard(name: kStoryBoard_CreateExperience, bundle: nil).instantiateViewController(withIdentifier: String(describing: Step3MainViewController.self)) as! Step3MainViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
