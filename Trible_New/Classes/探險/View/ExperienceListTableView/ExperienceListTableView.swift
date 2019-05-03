//
//  ExperienceListTableView.swift
//  TribleHome
//
//  Created by Daniel on 2018/10/9.
//  Copyright © 2018年 Daniel. All rights reserved.
//

import UIKit

class ExperienceListTableView: BaseTableView {
    
    // MARK: Override Function
    override func configureTableView() {
        super.configureTableView()
        self.register(UINib(nibName: String(describing: ExperienceListTableViewCell.self), bundle: nil), forCellReuseIdentifier: ExperienceListTableViewCell.identifier)
    }
    
    // MARK: Override UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExperienceListTableViewCell.identifier, for: indexPath)
        return cell
    }
    
    // MARK: Override UITableViewDelegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (screenWidth - safeAreaInsets.bottom) * 0.9
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: kStoryBoard_Experience, bundle: nil).instantiateViewController(withIdentifier: String(describing: ExperienceDetailViewController.self)) as! ExperienceDetailViewController
        self.parentViewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
