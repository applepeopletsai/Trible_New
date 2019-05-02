//
//  CustomTabBar.swift
//  Trible_New
//
//  Created by Daniel on 2018/10/7.
//  Copyright © 2018年 Daniel. All rights reserved.
//

import UIKit

protocol CustomTabBarDelegate: NSObjectProtocol {
    func didSelectItemAt(_ index: Int)
}

class CustomTabBar: UIView {
    
    private var selectIndex: Int = 0 {
        didSet {
            changeSelectIndex()
        }
    }
    
    private var tabBarItemArray = [CustomTabBarItem]()
    private weak var delegate: CustomTabBarDelegate?
    
    // MARK: Method
    func changeSelectIndexTo(_ index: Int) {
        self.selectIndex = index
    }
    
    static func getTabBarWith(frame: CGRect, tabBarItemModelArray:[CustomTabBarItemModel], backgroundColor: UIColor, delegate: CustomTabBarDelegate?) -> CustomTabBar {
        let view = CustomTabBar(frame: frame)
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: -2)
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 2
        view.delegate = delegate
        view.setupTabBarWith(tabBarItemModelArray: tabBarItemModelArray, backgroundColor: backgroundColor)
        return view
    }
    
    private func setupTabBarWith(tabBarItemModelArray:[CustomTabBarItemModel], backgroundColor: UIColor) {
        for i in 0..<tabBarItemModelArray.count {
            let width = self.frame.size.width / CGFloat(tabBarItemModelArray.count)
            let height = self.frame.size.height
            let x = width * CGFloat(i)
            let frame = CGRect(x: x, y: 0, width: width, height: height)
            let model = tabBarItemModelArray[i]
            
            guard let tabBarItem = CustomTabBarItem.getItemWith(frame: frame, selectImage: model.selectImage, unSelectImage: model.unSelectImage, tag: i, backgroundColor: backgroundColor, delegate: self) else {
                return
            }
            self.addSubview(tabBarItem)
            self.tabBarItemArray.append(tabBarItem)
        }
    }
    
    private func changeSelectIndex() {
        for item in tabBarItemArray {
            item.changeSelect(false)
        }
        tabBarItemArray[selectIndex].changeSelect(true)
        self.delegate?.didSelectItemAt(self.selectIndex)
    }
}

extension CustomTabBar: CustomTabBarItemDelegate {
    func tabBarItemPressWithTag(_ tag: Int) {
        self.selectIndex = tag
    }
}
