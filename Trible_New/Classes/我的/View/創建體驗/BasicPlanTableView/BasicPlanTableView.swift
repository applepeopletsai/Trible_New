//
//  BasicPlanTableView.swift
//  Trible_New
//
//  Created by Daniel on 2019/1/15.
//  Copyright © 2019年 Daniel. All rights reserved.
//

import UIKit

class BasicPlanTableView: UITableView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureTableView()
    }
    
    private func configureTableView() {
        self.dataSource = self
        self.delegate = self
        self.tableFooterView = UIView()
        self.register(UINib(nibName: String(describing: BasicPlanHeaderView.self), bundle: nil), forHeaderFooterViewReuseIdentifier: String(describing: BasicPlanHeaderView.self))
        self.register(UINib(nibName: String(describing: BasicPlanCell.self), bundle: nil), forCellReuseIdentifier: String(describing: BasicPlanCell.self))
    }
}

extension BasicPlanTableView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 2 {
            return 2
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: BasicPlanCell.self), for: indexPath) as! BasicPlanCell
        switch indexPath.section {
        case 0:
            cell.contentLabel.text = "基礎方案、方案A、單人方案"
            break
        case 1:
            cell.contentLabel.text = "500"
            break
        case 2:
            let array = ["天冷請帶外套","孕婦不得參加"]
            cell.contentLabel.text = array[indexPath.row]
            break
        default:
            break
        }
        return cell
    }
}

extension BasicPlanTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: String(describing: BasicPlanHeaderView.self)) as! BasicPlanHeaderView
        let array = ["方案名稱","方案價格","注意事項"]
        view.titleLabel.text = array[section]
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
}
