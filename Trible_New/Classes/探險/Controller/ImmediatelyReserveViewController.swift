//
//  ImmediatelyReserveViewController.swift
//  Trible_New
//
//  Created by Daniel on 2018/11/19.
//  Copyright © 2018年 Daniel. All rights reserved.
//

import UIKit

enum ResetType {
    case All, Date, Plan, Time
}

class ImmediatelyReserveViewController: BaseViewController {

    @IBOutlet private weak var reChooseButton: UIButton!
    @IBOutlet private weak var selectDateButton: UIButton!
    @IBOutlet private weak var selectPlanButton: UIButton!
    @IBOutlet private weak var selectTimeButton: UIButton!
    @IBOutlet private weak var peopleCountLabel: UILabel!
    @IBOutlet private weak var peopleCountViewHeight: NSLayoutConstraint!
    @IBOutlet private weak var totalPriceLabel: UILabel!
    
    private var selectDate: String?
    private var selectPlan: String?
    private var selectTime: String?
    private var peopleCount = 1
    private var totalPrice = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Method
    private func reset(type: ResetType) {
        switch type {
        case .All:
            reChooseButton.isEnabled = false
            selectDateButton.setTitle(LocalizedString("Lang_RI_004"), for: .normal)
            reset(type: .Date)
            break
        case .Date:
            selectPlanButton.isEnabled = false
            selectPlanButton.setTitle(LocalizedString("Lang_RI_006"), for: .normal)
            reset(type: .Plan)
            break
        case .Plan:
            selectTimeButton.isEnabled = false
            selectTimeButton.setTitle(LocalizedString("Lang_RI_008"), for: .normal)
            reset(type: .Time)
            break
        case .Time:
            peopleCountViewHeight.constant = 0
            constraintAnimation(duration: 0.3, completion: {
                self.resetLabel()
            })
            break
        }
    }
    
    private func configureLabel() {
        peopleCountLabel.text = String(peopleCount)
        totalPrice = peopleCount * 1000
        totalPriceLabel.text = String(totalPrice)
    }
    
    private func resetLabel() {
        peopleCount = 0
        peopleCountLabel.text = "0"
        totalPrice = 0
        totalPriceLabel.text = "0"
    }
    
    // MARK: Event Handler
    @IBAction private func reChooseButtonPress(_ sender: UIButton) {
        reset(type: .All)
    }
    
    @IBAction private func selectDateButtonPress(_ sender: UIButton) {
        PresentationTool.showCalendarWith(canSelectDayArray: nil, canNotSelectDayArray: nil, cancelAction: nil, confirmAction: { (date) in
            if date.transferToString() == self.selectDate { return }
            self.reChooseButton.isEnabled = true
            
            self.selectDate = date.transferToString()
            self.selectDateButton.setTitle(self.selectDate, for: .normal)
            self.reset(type: .Date)
            self.selectPlanButton.isEnabled = true
        })
    }
    
    @IBAction private func selectPlanButtonPress(_ sender: UIButton) {
        PresentationTool.showPickerWith(itemArray: ["方案A","方案B","方案C"], selectedIndex: 0, hintTitle: LocalizedString("Lang_RI_006"), cancelAction: nil, confirmAction: { (item, index) in
            if item == self.selectPlan { return }
            self.selectPlan = item
            self.selectPlanButton.setTitle(item, for: .normal)
            self.reset(type: .Plan)
            self.selectTimeButton.isEnabled = true
        })
    }
    
    @IBAction private func selectTimeButtonPress(_ sender: UIButton) {
        PresentationTool.showPickerWith(itemArray: ["01:00","02:00","03:00"], selectedIndex: 0, hintTitle: LocalizedString("Lang_RI_008"), cancelAction: nil, confirmAction: { (item, index) in
            if item == self.selectTime { return }
            self.selectTimeButton.setTitle(item, for: .normal)
            self.peopleCountViewHeight.constant = 100
            self.constraintAnimation(duration: 0.3, completion: {
                self.resetLabel()
            })
        })
    }
    
    @IBAction private func decreaseButtonPress(_ sender: UIButton) {
        if peopleCount == 1 { return }
        peopleCount -= 1
        configureLabel()
    }
    
    @IBAction private func incrreaseButtonPress(_ sender: UIButton) {
        if peopleCount == 10 { return }
        peopleCount += 1
        configureLabel()
    }
    
    @IBAction private func nextStepButtonPress(_ sender: UIButton) {
        let vc = UIStoryboard(name: kStoryBoard_Experience, bundle: nil).instantiateViewController(withIdentifier: String(describing: OrderConfirmViewController.self)) as! OrderConfirmViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
