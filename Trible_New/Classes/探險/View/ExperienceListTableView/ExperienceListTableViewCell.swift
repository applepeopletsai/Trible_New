//
//  ExperienceListTableViewCell.swift
//  TribleHome
//
//  Created by Daniel on 2018/10/9.
//  Copyright © 2018年 Daniel. All rights reserved.
//

import UIKit

class ExperienceListTableViewCell: UITableViewCell {

    override var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            var frame = newFrame
            frame.origin.x += 15
            frame.size.width -= 30
            frame.size.height -= 15
            super.frame = frame
            self.makeShadowAndCornerRadius()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}

