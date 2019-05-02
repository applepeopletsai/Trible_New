//
//  Step2MainViewController.swift
//  Trible_New
//
//  Created by Daniel on 2019/1/9.
//  Copyright © 2019年 Daniel. All rights reserved.
//

import UIKit

class Step2MainViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: Event Handler
    @IBAction private func step2_1ButtonPress(_ sender: UIButton) {
        let vc = UIStoryboard(name: kStoryBoard_CreateExperience, bundle: nil).instantiateViewController(withIdentifier: String(describing: Step2_1ViewController.self)) as! Step2_1ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction private func step2_2ButtonPress(_ sender: UIButton) {
        let vc = UIStoryboard(name: kStoryBoard_CreateExperience, bundle: nil).instantiateViewController(withIdentifier: String(describing: Step2_2ViewController.self)) as! Step2_2ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction private func step2_3ButtonPress(_ sender: UIButton) {
        let vc = UIStoryboard(name: kStoryBoard_CreateExperience, bundle: nil).instantiateViewController(withIdentifier: String(describing: Step2_3ViewController.self)) as! Step2_3ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction private func step2_4ButtonPress(_ sender: UIButton) {
        let vc = UIStoryboard(name: kStoryBoard_CreateExperience, bundle: nil).instantiateViewController(withIdentifier: String(describing: Step2_4ViewController.self)) as! Step2_4ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction private func step2_5ButtonPress(_ sender: UIButton) {
        let vc = UIStoryboard(name: kStoryBoard_CreateExperience, bundle: nil).instantiateViewController(withIdentifier: String(describing: Step2_5ViewController.self)) as! Step2_5ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
