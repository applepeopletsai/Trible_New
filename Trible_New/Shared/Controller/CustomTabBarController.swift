//
//  CustomTabBarController.swift
//  Trible_New
//
//  Created by Daniel on 2018/10/7.
//  Copyright © 2018年 Daniel. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {

    private var tabBarItemModelArray: [CustomTabBarItemModel] {
        var array = [CustomTabBarItemModel]()
        let selectImage = ["tab_homepage_select",
                           "tab_mail_unselect",
                           "tab_like_unselect",
                           "tab_clipboards_unselect",
                           "tab_man_unselect"]
        let unSelectImage = ["tab_homepage_select",
                             "tab_mail_unselect",
                             "tab_like_unselect",
                             "tab_clipboards_unselect",
                             "tab_man_unselect"]
        
        for i in 0..<selectImage.count {
            array.append(CustomTabBarItemModel(selectImage: selectImage[i], unSelectImage: unSelectImage[i]))
        }
        return array
    }
    
    private var navigationVCArray: [UINavigationController] {
        var array = [UINavigationController]()
        let name = [kStoryBoard_Experience,
                    kStoryBoard_Message,
                    kStoryBoard_WishList,
                    kStoryBoard_Order,
                    kStoryBoard_My]
        let identifier = [String(describing: ExperienceMainViewController.self),
                          String(describing: MessageMainViewController.self),
                          String(describing: WishListMainViewController.self),
                          String(describing: OrderMainViewController.self),
                          String(describing: MyMainViewController.self)]
        
        for i in 0..<name.count {
            let vc = UINavigationController(rootViewController: UIStoryboard(name: name[i], bundle: nil).instantiateViewController(withIdentifier: identifier[i]))
            vc.isNavigationBarHidden = true
            array.append(vc)
        }
        
        return array
    }
    
    private var customTabBar = CustomTabBar()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
    }
    
    // MARK: Method
    func changeSelectIndexTo(_ index: Int) {
        self.customTabBar.changeSelectIndexTo(index)
    }
    
    private func configureTabBar() {
        self.viewControllers = navigationVCArray
        
        self.customTabBar = CustomTabBar.getTabBarWith(frame: self.tabBar.bounds, tabBarItemModelArray: tabBarItemModelArray, backgroundColor: .white, delegate: self)
        self.tabBar.addSubview(customTabBar)
        
        // hide bottom bar on push 會有auto layout的問題
        // 解決辦法參考：https://stackoverflow.com/a/28724828、https://blog.csdn.net/Ethan_Wan/article/details/51778130
        self.tabBar.isTranslucent = false
    }
}

extension CustomTabBarController: CustomTabBarDelegate {
    func didSelectItemAt(_ index: Int) {
        if self.selectedIndex != index {
            self.selectedIndex = index
        } else {
            if let navigations = self.viewControllers as? [UINavigationController] {
                let naviVC = navigations[self.selectedIndex]
                if naviVC.viewControllers.count > 1 {
                    naviVC.popToRootViewController(animated: true)
                } else {
                    print("滑至頂端")
                }
            }
        }
    }
}
