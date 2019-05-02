//
//  CalendarCollectionView.swift
//  Trible_New
//
//  Created by Daniel on 2018/11/13.
//  Copyright © 2018年 Daniel. All rights reserved.
//

import UIKit
import JTAppleCalendar

protocol CalendarCollectionViewDelegate: NSObjectProtocol {
    func currentMonthChanged(month: Int, year: Int)
    func didSelectDate(_ date: Date)
}

class CalendarCollectionView: JTAppleCalendarView {

    private var canSelectDayArray = [Date]()
    private var canNotSelectDayArray = [Date]()
    
    private weak var calendarCollectionViewDelegate: CalendarCollectionViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerCell()
        configureCalendar()
    }
    
    // MARK: Method
    func setupCollectionViewWith(canSelectDayArray: [Date]?, canNotSelectDayArray: [Date]?, delegate: CalendarCollectionViewDelegate?) {
        if let canSelectDayArray = canSelectDayArray {
            self.canSelectDayArray = canSelectDayArray
        }
        if let canNotSelectDayArray = canNotSelectDayArray {
            self.canNotSelectDayArray = canNotSelectDayArray
        }
        self.calendarCollectionViewDelegate = delegate
    }
    
    private func configureCalendar() {
        self.ibCalendarDataSource = self
        self.ibCalendarDelegate = self
        self.minimumInteritemSpacing = 3
        self.visibleDates { [unowned self] (visibleDates: DateSegmentInfo) in
            self.dateChanged(from: visibleDates)
        }
    }
    
    private func registerCell() {
        self.register(UINib(nibName: String(describing: CalendarCollectionCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: CalendarCollectionCell.self))
    }
    
    fileprivate func dateChanged(from visibleDates: DateSegmentInfo) {
        guard let startDate = visibleDates.monthDates.first?.date else {
            return
        }
        let month = Calendar.current.dateComponents([.month], from: startDate).month!
        let year = Calendar.current.component(.year, from: startDate)
        calendarCollectionViewDelegate?.currentMonthChanged(month: month, year: year)
    }
    
    fileprivate func configureVisibleCellWith(cell: JTAppleCell, cellState: CellState, date: Date) {
        guard let cell = cell as? CalendarCollectionCell  else { return }
        if cellState.dateBelongsTo == .thisMonth {
            cell.isHidden = false
        } else {
            cell.isHidden = true
            return
        }
        
        cell.dayLabel.text = cellState.text
        cell.bgView.layer.cornerRadius = cell.frame.size.width * 0.5
    }
    
    fileprivate func handleCellSelectionWith(cell: JTAppleCell?, cellState: CellState) {
        guard let cell = cell as? CalendarCollectionCell else { return }
        
        if dateSelectable(cellState.date) {
            if cellState.isSelected {
                cell.bgView.backgroundColor = color_379D86
                cell.dayLabel.textColor = UIColor.white
            } else {
                cell.bgView.backgroundColor = UIColor.white
                cell.dayLabel.textColor = color_379D86
            }
        } else {
            cell.bgView.backgroundColor = UIColor.white
            cell.dayLabel.textColor = color_9B9B9B
        }
    }
    
    fileprivate func dateSelectable(_ date: Date) -> Bool {
        if canSelectDayArray.count > 0 {
            for canSelectDate in canSelectDayArray {
                if canSelectDate == date {
                    return true
                }
            }
            return false
        } else if canNotSelectDayArray.count > 0 {
            for shouldNotSelectDay in canNotSelectDayArray {
                if date == shouldNotSelectDay {
                    return false
                }
            }
            return true
        } else {
            return true
        }
    }
}

extension CalendarCollectionView: JTAppleCalendarViewDataSource, JTAppleCalendarViewDelegate {
    
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        let currentYear = Calendar.current.component(.year, from: Date())
        let startDate = Date.from(year: currentYear, month: 1, day: 1)
        let endDate = Date.from(year: currentYear + 3, month: 12, day: 31)
        
        let parameters = ConfigurationParameters(startDate: startDate, endDate: endDate)
        return parameters
    }
    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: String(describing: CalendarCollectionCell.self), for: indexPath) as! CalendarCollectionCell
        configureVisibleCellWith(cell: cell, cellState: cellState, date: date)
        handleCellSelectionWith(cell: cell, cellState: cellState)
        return cell
    }
    
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        configureVisibleCellWith(cell: cell, cellState: cellState, date: date)
        handleCellSelectionWith(cell: cell, cellState: cellState)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        dateChanged(from: visibleDates)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        handleCellSelectionWith(cell: cell, cellState: cellState)
        calendarCollectionViewDelegate?.didSelectDate(date)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        handleCellSelectionWith(cell: cell, cellState: cellState)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, shouldSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) -> Bool {
        return dateSelectable(date)
    }
}
