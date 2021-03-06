//
//  MyExperienceListTableView.swift
//  Trible_New
//
//  Created by Daniel on 2018/12/25.
//  Copyright © 2018年 Daniel. All rights reserved.
//

import UIKit

class MyExperienceListTableView: BaseTableView {
    
    // MARK: Override Function
    override func configureTableView() {
        super.configureTableView()
        self.register(UINib(nibName: String(describing: MyExperienceListCell.self), bundle: nil), forCellReuseIdentifier: MyExperienceListCell.identifier)
    }
    
    // MARK: Override UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MyExperienceListCell.self), for: indexPath) as! MyExperienceListCell
        return cell
    }
    
    // MARK: Override UITableViewDelegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let preview = UITableViewRowAction(style: .normal, title: "預覽\n體驗", handler: { (action, indexPath) in
            print(indexPath)
            tableView.setEditing(false, animated: true)
        })
        preview.backgroundColor = color_31D0C1
        
        let gotoCalendar = UITableViewRowAction(style: .normal, title: "前往\n日曆", handler: { (action, indexPath) in
            print(indexPath)
            tableView.setEditing(false, animated: true)
        })
        gotoCalendar.backgroundColor = color_31D0C1
        
        let up = UITableViewRowAction(style: .normal, title: "上架\n體驗", handler: { (action, indexPath) in
            print(indexPath)
            tableView.setEditing(false, animated: true)
        })
        up.backgroundColor = color_31D0C1
        
        let fix = UITableViewRowAction(style: .normal, title: "修改\n體驗", handler: { (action, indexPath) in
            print(indexPath)
            tableView.setEditing(false, animated: true)
        })
        fix.backgroundColor = color_31D0C1
        
        return [fix, up, gotoCalendar, preview]
    }
}
