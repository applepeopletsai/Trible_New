//
//  MyExperienceMainViewController.swift
//  Trible_New
//
//  Created by Daniel on 2018/12/25.
//  Copyright © 2018年 Daniel. All rights reserved.
//

import UIKit

class MyExperienceMainViewController: BaseViewController {

    @IBOutlet private weak var tableView: MyExperienceListTableView!
    @IBOutlet private weak var nonExperienceView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        nonExperienceView.isHidden = false
        tableView.isHidden = false
    }

    @IBAction private func increaseButtonPress(_ sender: UIButton) {
        let vc = UIStoryboard(name: kStoryBoard_CreateExperience, bundle: nil).instantiateViewController(withIdentifier: String(describing: CreateExperienceMainViewController.self)) as! CreateExperienceMainViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
