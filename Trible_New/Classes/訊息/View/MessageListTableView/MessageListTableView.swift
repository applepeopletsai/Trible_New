//
//  MessageListTableView.swift
//  Trible_New
//
//  Created by Daniel on 2019/5/3.
//  Copyright © 2019 Daniel. All rights reserved.
//

import UIKit

class MessageListTableView: BaseTableView {
    
    // MARK: Override Function
    override func configureTableView() {
        super.configureTableView()
        
        self.separatorColor = .gray
        self.register(UINib(nibName: String(describing: MessageListCell.self), bundle: nil), forCellReuseIdentifier: MessageListCell.identifier)
    }

    // MARK: Override UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MessageListCell.identifier, for: indexPath)
        return cell
    }
    
    // MARK: Override UITableViewDelegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}
