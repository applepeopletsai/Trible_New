//
//  TravelDataTableView.swift
//  Trible_New
//
//  Created by Daniel on 2018/12/18.
//  Copyright © 2018年 Daniel. All rights reserved.
//

import UIKit

class TravelDataTableView: UITableView {

    override func awakeFromNib() {
        super.awakeFromNib()
        configureTableView()
    }
    
    // MARK: Method
    private func configureTableView() {
        self.dataSource = self
        self.delegate = self
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        self.allowsSelection = false
        self.separatorColor = .clear
        self.register(UINib(nibName: String(describing: TravelDataHeaderView.self), bundle: nil), forHeaderFooterViewReuseIdentifier: String(describing: TravelDataHeaderView.self))
        self.register(UINib(nibName: String(describing: TravelDataExplorerCell.self), bundle: nil), forCellReuseIdentifier: String(describing: TravelDataExplorerCell.self))
        self.register(UINib(nibName: String(describing: TravelDataEmergencyContactCell.self), bundle: nil), forCellReuseIdentifier: String(describing: TravelDataEmergencyContactCell.self))
        self.register(UINib(nibName: String(describing: TravelDataRemarkCell.self), bundle: nil), forCellReuseIdentifier: String(describing: TravelDataRemarkCell.self))
    }
}

extension TravelDataTableView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: TravelDataExplorerCell.identifier, for: indexPath) as! TravelDataExplorerCell
            cell.titleLabel.text = LocalizedString("Lang_GE_014") + String(indexPath.row + 1)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: TravelDataEmergencyContactCell.identifier, for: indexPath)
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: TravelDataRemarkCell.identifier, for: indexPath)
            return cell
        default:
            return UITableViewCell()
        }
    }
}

extension TravelDataTableView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 400
        case 1:
            return 290
        case 2:
            return 150 
        default:
            return CGFloat.leastNormalMagnitude
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:String(describing: TravelDataHeaderView.self)) as! TravelDataHeaderView
        switch section {
        case 0:
            view.titleLabel.text = LocalizedString("Lang_RI_039")
            break
        case 1:
            view.titleLabel.text = LocalizedString("Lang_RI_040")
            break
        case 2:
            view.titleLabel.text = LocalizedString("Lang_RI_041")
            break
        default:
            break
        }
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        view.backgroundColor = color_F4F4F4
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 2 {
            return CGFloat.leastNormalMagnitude
        }
        return 20
    }
}
