//
//  InputBoxTableView.swift
//  Trible_New
//
//  Created by Daniel on 2019/1/16.
//  Copyright © 2019年 Daniel. All rights reserved.
//

import UIKit

enum InputBoxTableViewType {
    case ExperienceFeatures // 體驗特點(step 2-4)
    case ReminderExplorer   // 提醒探險家(step 2-5)
    case CostInvolve        // 費用包含(step 1-2,3-2)
}

protocol InputBoxTableViewDelegate: class {
    func didUpdateInputTextArray(array: [String])
}

class InputBoxTableView: UITableView {
    
    @IBInspectable var typeString: String = "ExperienceFeatures" {
        didSet {
            switch typeString {
            case "ExperienceFeatures":
                type = .ExperienceFeatures
                break
            case "ReminderExplorer":
                type = .ReminderExplorer
                break
            case "CostInvolve":
                type = .CostInvolve
                break
            default: break
            }
        }
    }
    
    private var type: InputBoxTableViewType = .ExperienceFeatures
    private var inputTextArray = [""]
    private weak var inputBoxTableViewDelegate: InputBoxTableViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureTableView()
    }
    
    // MARK: Event Handelr
    func configureTableViewWith(inputTextArray: [String], delegate: InputBoxTableViewDelegate) {
        self.inputBoxTableViewDelegate = delegate
        self.inputTextArray = inputTextArray
        self.reloadData()
    }
    
    func data() -> [String] {
        return inputTextArray
    }
    
    private func configureTableView() {
        self.dataSource = self
        self.delegate = self
        self.tableFooterView = UIView()
        self.register(UINib(nibName: String(describing: InputBoxCell.self), bundle: nil), forCellReuseIdentifier: String(describing: InputBoxCell.self))
    }
}

extension InputBoxTableView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inputTextArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: InputBoxCell.self), for: indexPath) as! InputBoxCell
        cell.configureCellWith(inputText: inputTextArray[indexPath.row], indexPath: indexPath, type: type, delegate: self)
        return cell
    }
}

extension InputBoxTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

extension InputBoxTableView: InputBoxCellDelegate {
    func rightButtonPressAtIndexPath(_ indexPath: IndexPath) {
        if (inputTextArray.count == 1 || indexPath.row == 0) {
            let maxCount = (type == .CostInvolve) ? 4 : 5
            if inputTextArray.count < maxCount {
                self.inputTextArray.append("")
            } else {
                print("上限\(maxCount)個")
            }
        } else {
            self.inputTextArray.remove(at: indexPath.row)
        }
        self.reloadData()
        self.inputBoxTableViewDelegate?.didUpdateInputTextArray(array: inputTextArray)
    }
    
    func didChangeInputText(atIndexPath indexPath: IndexPath, withText text: String) {
        self.inputTextArray[indexPath.row] = text
        self.inputBoxTableViewDelegate?.didUpdateInputTextArray(array: inputTextArray)
    }
}
