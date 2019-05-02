//
//  DataVerifyViewController.swift
//  Trible_New
//
//  Created by Daniel on 2019/2/19.
//  Copyright © 2019年 Daniel. All rights reserved.
//

import UIKit

enum DataVerifyButtonType: Int {
    case Email = 0, Phone, Facebook, Google
}

class DataVerifyViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Event Handler
    @IBAction private func buttonPrerss(_ sender: UIButton) {
        guard let type = DataVerifyButtonType(rawValue: sender.tag) else { return }
        switch type {
        case .Email, .Phone:
            let vc = UIStoryboard(name: kStoryBoard_My, bundle: nil).instantiateViewController(withIdentifier: String(describing: InputVerifyViewController.self)) as! InputVerifyViewController
            vc.setupWithType(type: type)
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case .Facebook, .Google:
            break
        }
    }

}
