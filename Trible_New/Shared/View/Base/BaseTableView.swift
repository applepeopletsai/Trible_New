//
//  BaseTableView.swift
//  Trible_New
//
//  Created by Daniel on 2019/5/3.
//  Copyright © 2019 Daniel. All rights reserved.
//

import UIKit

class BaseTableView: UITableView {
    
    var dataArray: [AnyObject]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureTableView()
    }
    
    func configureTableView() {
        self.dataSource = self
        self.delegate = self
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        self.separatorColor = .clear
        self.tableFooterView = UIView()
        self.delaysContentTouches = false   //touch事件立即傳遞給subView
    }
}

extension BaseTableView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension BaseTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
