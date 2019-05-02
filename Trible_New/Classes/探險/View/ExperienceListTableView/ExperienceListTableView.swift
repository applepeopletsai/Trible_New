//
//  ExperienceListTableView.swift
//  TribleHome
//
//  Created by Daniel on 2018/10/9.
//  Copyright © 2018年 Daniel. All rights reserved.
//

import UIKit

class ExperienceListTableView: UITableView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureTableView()
    }
    
    private func configureTableView() {
        self.dataSource = self
        self.delegate = self
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        self.delaysContentTouches = false
        self.separatorColor = .clear
        self.register(UINib(nibName: String(describing: ExperienceListTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: ExperienceListTableViewCell.self))
    }
}

extension ExperienceListTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExperienceListTableViewCell.identifier, for: indexPath)
        return cell
    }
}

extension ExperienceListTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (screenWidth - 20) * 0.9
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: kStoryBoard_Experience, bundle: nil).instantiateViewController(withIdentifier: String(describing: ExperienceDetailViewController.self)) as! ExperienceDetailViewController
        self.parentViewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
