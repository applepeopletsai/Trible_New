//
//  ExtensionUITableViewCell.swift
//  Trible_New
//
//  Created by Daniel on 2019/4/29.
//  Copyright © 2019 Daniel. All rights reserved.
//

import UIKit

extension UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
    
    func makeShadowAndCornerRadius() {
        self.contentView.backgroundColor = UIColor.white
        self.contentView.layer.cornerRadius = 3.0
        self.contentView.layer.masksToBounds = true
        
        self.backgroundColor = UIColor.clear
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        self.layer.masksToBounds = false
    }
}
