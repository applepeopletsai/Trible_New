//
//  ExperienceHomeTableView.swift
//  TribleHome
//
//  Created by Daniel on 2018/10/9.
//  Copyright © 2018年 Daniel. All rights reserved.
//

import UIKit

class ExperienceHomeTableView: UITableView {
    
    // MARK: Property
    private var collectionViewContentOffset = [CGPoint]()
    
    // MARK: Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configureTableView()
        addObserver()
        
        for _ in 0..<5 {
            collectionViewContentOffset.append(CGPoint.zero)
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: Method
    private func configureTableView() {
        self.dataSource = self
        self.delegate = self
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        self.delaysContentTouches = false
        self.allowsSelection = false
        self.separatorColor = .clear
        self.register(UINib(nibName: String(describing: ExperienceHomeTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: ExperienceHomeTableViewCell.self))
    }
    
    private func addObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(changeCollectionViewContentOffset(noti:)), name: NSNotification.Name(rawValue: kCollectionViewContentOffset), object: nil)
    }
    
    @objc private func changeCollectionViewContentOffset(noti: Notification) {
        if let contentOffset = noti.userInfo?["contentOffset"] as? CGPoint, let index = noti.userInfo?["index"] as? Int {
            collectionViewContentOffset[index] = contentOffset
        }
    }
}

extension ExperienceHomeTableView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collectionViewContentOffset.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExperienceHomeTableViewCell.identifier, for: indexPath) as! ExperienceHomeTableViewCell
        cell.collectionView.type = (indexPath.row == 1) ? .Image : .Normal
        cell.collectionView.index = indexPath.row
        cell.collectionView.contentOffset = collectionViewContentOffset[indexPath.row]
        return cell
    }
}

extension ExperienceHomeTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ((indexPath.row == 1) ? experienceItemHeight_Image : experienceItemHeight_Normal) + 40
    }
}
