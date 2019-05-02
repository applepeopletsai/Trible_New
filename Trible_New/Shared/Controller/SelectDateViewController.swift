//
//  SelectDateViewController.swift
//  Trible_New
//
//  Created by Daniel on 2018/11/13.
//  Copyright © 2018年 Daniel. All rights reserved.
//

import UIKit

typealias selectDateHandler = (_ date: Date) -> Void

class SelectDateViewController: UIViewController {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var calendarView: CalendarCollectionView!
    
    private var canSelectDayArray: [Date]?
    private var canNotSelectDayArray: [Date]?
    private var cancelAction: actionHandler?
    private var confirmAction: selectDateHandler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCalendarCollectionView()
    }
    
    func setupVCWith(canSelectDayArray: [Date]?, canNotSelectDayArray: [Date]?, cancelAction: actionHandler?, confirmAction: selectDateHandler?) {
        self.canSelectDayArray = canSelectDayArray
        self.canNotSelectDayArray = canNotSelectDayArray
        self.cancelAction = cancelAction
        self.confirmAction = confirmAction
    }
    
    private func configureCalendarCollectionView() {
        self.calendarView.setupCollectionViewWith(canSelectDayArray: canSelectDayArray, canNotSelectDayArray: canNotSelectDayArray, delegate: self)
    }

    // MARK: Event Handler
    @IBAction private func previousButtonPress(_ sender: UIButton) {
        calendarView.scrollToSegment(.previous)
    }
    
    @IBAction private func nextButtonPress(_ sender: UIButton) {
        calendarView.scrollToSegment(.next)
    }
    
    @IBAction private func cancelButtonPress(_ sender: UIButton) {
        cancelAction?()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction private func confirmButtonPress(_ sender: UIButton) {
        if let date = calendarView.selectedDates.last {
            confirmAction?(date)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension SelectDateViewController: CalendarCollectionViewDelegate {
    func currentMonthChanged(month: Int, year: Int) {
        self.titleLabel.text = "\(month)\(LocalizedString("Lang_GE_001")) \(year)"
    }
    
    func didSelectDate(_ date: Date) {
        
    }
}
