//
//  MyMainViewController.swift
//  Trible_New
//
//  Created by Daniel on 2018/10/17.
//  Copyright © 2018年 Daniel. All rights reserved.
//

import UIKit

private enum MyMainViewButtonType: Int {
    case MyExperience = 0, DataVerify, Setting, SystemNotify
}

class MyMainViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: Event Handler
    @IBAction private func buttonPress(_ sender: UIButton) {
        guard let type = MyMainViewButtonType(rawValue: sender.tag) else { return }
        switch type {
            
        case .MyExperience:
            let vc = UIStoryboard(name: kStoryBoard_My, bundle: nil).instantiateViewController(withIdentifier: String(describing: MyExperienceMainViewController.self)) as! MyExperienceMainViewController
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case .DataVerify:
            let vc = UIStoryboard(name: kStoryBoard_My, bundle: nil).instantiateViewController(withIdentifier: String(describing: DataVerifyViewController.self)) as! DataVerifyViewController
            self.navigationController?.pushViewController(vc, animated: true)
            break
        default:
            break
        }
    }
}
