//
//  ExperienceHomeTableView.swift
//  TribleHome
//
//  Created by Daniel on 2018/10/9.
//  Copyright © 2018年 Daniel. All rights reserved.
//

import UIKit

class ExperienceHomeTableView: BaseTableView {
    
    // MARK: Property
    private var collectionViewContentOffset = [CGPoint]()
    
    // MARK: Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addObserver()
        
        for _ in 0..<5 {
            collectionViewContentOffset.append(CGPoint.zero)
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: Override Function
    override func configureTableView() {
        super.configureTableView()
        self.register(UINib(nibName: String(describing: ExperienceHomeTableViewCell.self), bundle: nil), forCellReuseIdentifier: ExperienceHomeTableViewCell.identifier)
    }
    
    // MARK: Private Function
    private func addObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(changeCollectionViewContentOffset(noti:)), name: NSNotification.Name(rawValue: kCollectionViewContentOffset), object: nil)
    }
    
    @objc private func changeCollectionViewContentOffset(noti: Notification) {
        if let contentOffset = noti.userInfo?["contentOffset"] as? CGPoint, let index = noti.userInfo?["index"] as? Int {
            collectionViewContentOffset[index] = contentOffset
        }
    }
    
    // MARK: Override UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collectionViewContentOffset.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExperienceHomeTableViewCell.identifier, for: indexPath) as! ExperienceHomeTableViewCell
        cell.collectionView.type = (indexPath.row == 1) ? .Image : .Normal
        cell.collectionView.index = indexPath.row
        cell.collectionView.contentOffset = collectionViewContentOffset[indexPath.row]
        return cell
    }
    
    // MARK: Override UITableViewDelegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ((indexPath.row == 1) ? experienceItemHeight_Image : experienceItemHeight_Normal) + 40
    }
}
