//
//  OtherPlanTableView.swift
//  Trible_New
//
//  Created by Daniel on 2019/1/16.
//  Copyright © 2019年 Daniel. All rights reserved.
//

import UIKit

struct OtherPlanModel {
    var planName: String
    var planDes: String
    var peopleCount: Int
    var items: [String]
}

class OtherPlanTableView: UITableView {
    
    private var otherPlanArray = [OtherPlanModel]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureTableView()
    }
    
    // MARK: Event Handler
    func increasePlan() {
        self.otherPlanArray.append(OtherPlanModel(planName: "", planDes: "", peopleCount: 1, items: [""]))
        self.reloadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            self.scrollToRow(at: IndexPath(row: self.otherPlanArray.count - 1, section: 0), at: .bottom, animated: true)
        })
    }
    
    func data() -> [OtherPlanModel] {
        return otherPlanArray
    }
    
    private func configureTableView() {
        self.dataSource = self
        self.delegate = self
        self.tableFooterView = UIView()
        self.register(UINib(nibName: String(describing: OtherPlanCell.self), bundle: nil), forCellReuseIdentifier: OtherPlanCell.identifier)
    }
}


extension OtherPlanTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return otherPlanArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: OtherPlanCell.self), for: indexPath) as! OtherPlanCell
        cell.configureCellWith(model: self.otherPlanArray[indexPath.row], indexPath: indexPath, delegate: self)
        return cell
    }
}

extension OtherPlanTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // 這裡還要再改，目前是固定只有一個其他方案
        return 300 + CGFloat(otherPlanArray[indexPath.row].items.count * 50)
    }
}

extension OtherPlanTableView: OtherPlanCellDelegate {
    func didDeletePress(atIndexPath indexPath: IndexPath) {
        self.otherPlanArray.remove(at: indexPath.row)
        self.reloadData()
    }
    
    func didUpdatePlanName(atIndexPath indexPath: IndexPath, name: String) {
        self.otherPlanArray[indexPath.row].planName = name
    }
    
    func didUpdatePlanDescription(atIndexPath indexPath: IndexPath, description: String) {
        self.otherPlanArray[indexPath.row].planDes = description
    }
    
    func didUpdatePeopleCount(atIndexPath indexPath: IndexPath, count: Int) {
        self.otherPlanArray[indexPath.row].peopleCount = count
    }
    
    func didUpdateCostInvolveArray(atIndexPath indexPath: IndexPath, costInVolveArray: [String]) {
        if self.otherPlanArray[indexPath.row].items.count != costInVolveArray.count {
            self.reloadData()
        }
        self.otherPlanArray[indexPath.row].items = costInVolveArray
    }
}
