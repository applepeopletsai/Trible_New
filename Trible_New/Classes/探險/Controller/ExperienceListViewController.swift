//
//  ExperienceListViewController.swift
//  Trible_New
//
//  Created by Daniel on 2018/11/13.
//  Copyright © 2018年 Daniel. All rights reserved.
//

import UIKit

class ExperienceListViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: Event Handler
    @IBAction private func dateButtonPress(_ sender: UIButton) {
        PresentationTool.showCalendarWith(canSelectDayArray: nil, canNotSelectDayArray: nil, cancelAction: nil, confirmAction: { (date) in
            print(date)
        })
    }
    
    @IBAction private func peopleCountButtonPress(_ sender: UIButton) {
        PresentationTool.showSelectPeopleCountWith(cancelAction: nil, confirmAction: { (count) in
            print(count)
        })
    }
    
    @IBAction private func filterButtonPress(_ sender: UIButton) {
        let vc = UIStoryboard(name: kStoryBoard_Shared, bundle: nil).instantiateViewController(withIdentifier: String(describing: FilterViewController.self)) as! FilterViewController
        self.present(vc, animated: true, completion: nil)
    }
}

extension ExperienceListViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
