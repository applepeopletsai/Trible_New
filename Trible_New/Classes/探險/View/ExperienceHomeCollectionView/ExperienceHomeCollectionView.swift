//
//  ExperienceHomeCollectionView.swift
//  TribleHome
//
//  Created by Daniel on 2018/10/9.
//  Copyright © 2018年 Daniel. All rights reserved.
//

import UIKit

enum ExperienceListCollectionViewType {
    case Normal, Image
}

let experienceItemWidth = UIScreen.main.bounds.size.width * 0.6
let experienceItemHeight_Normal = experienceItemWidth
let experienceItemHeight_Image = experienceItemWidth * 0.7
let kCollectionViewContentOffset = "CollectionViewContentOffset"

class ExperienceHomeCollectionView: UICollectionView {

    // MARK: Property
    var index: Int = 0
    var oldContentOffset: CGPoint = .zero {
        didSet {
            self.setContentOffset(oldContentOffset, animated: false)
        }
    }
    var type: ExperienceListCollectionViewType = .Normal {
        didSet {
            if oldValue != type {
                self.reloadData()
            }
        }
    }
    
    // MARK: Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCollectionView()
    }
    
    // MARK: Method
    private func configureCollectionView() {
        self.dataSource = self
        self.delegate = self
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        self.delaysContentTouches = false
        
        self.register(UINib(nibName: String(describing: ExperienceHomeCollectionViewCell_Normal.self), bundle: nil), forCellWithReuseIdentifier: String(describing: ExperienceHomeCollectionViewCell_Normal.self))
        self.register(UINib(nibName: String(describing: ExperienceHomeCollectionViewCell_Image.self), bundle: nil), forCellWithReuseIdentifier: String(describing: ExperienceHomeCollectionViewCell_Image.self))
    }
}

extension ExperienceHomeCollectionView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if type == .Image {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExperienceHomeCollectionViewCell_Image.identifier, for: indexPath)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExperienceHomeCollectionViewCell_Normal.identifier, for: indexPath)
            return cell
        }
    }
}

extension ExperienceHomeCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: kStoryBoard_Experience, bundle: nil).instantiateViewController(withIdentifier: String(describing: ExperienceListViewController.self)) as! ExperienceListViewController
        self.parentViewController?.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ExperienceHomeCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return (type == .Image) ? CGSize(width: experienceItemWidth, height: experienceItemHeight_Image - 5) : CGSize(width: experienceItemWidth, height: experienceItemHeight_Normal - 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return (type == .Image) ? 3 : 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
}

extension ExperienceHomeCollectionView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: kCollectionViewContentOffset), object: nil, userInfo: ["contentOffset":scrollView.contentOffset,"index":index])
    }
}

