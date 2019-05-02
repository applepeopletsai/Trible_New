//
//  CustomTabBarItem.swift
//  Trible_New
//
//  Created by Daniel on 2018/10/7.
//  Copyright © 2018年 Daniel. All rights reserved.
//

import UIKit

struct CustomTabBarItemModel {
    var selectImage: String
    var unSelectImage: String
}

protocol CustomTabBarItemDelegate: NSObjectProtocol {
    func tabBarItemPressWithTag(_ tag: Int)
}

class CustomTabBarItem: UIView {

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var badgeLabel: UILabel!

    private weak var delegate: CustomTabBarItemDelegate?
    
    private var select: Bool = false {
        didSet {
            self.imageView.isHighlighted = select
        }
    }
    
    private var badge: String? = nil {
        didSet {
            setupBadgeLabel()
        }
    }
    
    // MARK: Method
    static func getItemWith(frame: CGRect, selectImage: String, unSelectImage: String, tag: Int, backgroundColor: UIColor, delegate: CustomTabBarItemDelegate?) -> CustomTabBarItem? {
        
        guard let tabBarItem = Bundle.main.loadNibNamed(String(describing: CustomTabBarItem.self), owner: nil, options: nil)?.first as? CustomTabBarItem else {
            return nil
        }
        
        tabBarItem.frame = frame
        tabBarItem.tag = tag
        tabBarItem.backgroundColor = backgroundColor
        tabBarItem.imageView.image = UIImage(named: unSelectImage)
        tabBarItem.imageView.highlightedImage = UIImage(named: selectImage)
        tabBarItem.delegate = delegate
        tabBarItem.select = (tag == 0) ? true : false
        tabBarItem.setupBadgeLabel()
        
        return tabBarItem
    }
    
    /// 改變選取狀態
    func changeSelect(_ select: Bool) {
        self.select = select
    }
    
    /// 改變小紅點數字
    func changeBadge(badge: String) {
        self.badge = badge
    }
    
    private func setupBadgeLabel() {
        self.badgeLabel.text = self.badge
        
        let transform: CGAffineTransform = (self.badge == nil) ? CGAffineTransform(scaleX: 0.01, y: 0.01) : .identity
        let alpha: CGFloat = (self.badge == nil) ? 0 : 1
        
        UIView.animate(withDuration: 0.3, animations: {
            self.badgeLabel.transform = transform
            self.badgeLabel.alpha = alpha
        })
    }
    
    // MARK: Event Handler
    @IBAction private func buttonPress(_ sender: UIButton) {
        self.delegate?.tabBarItemPressWithTag(self.tag)
    }
}
