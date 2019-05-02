//
//  MyExperienceListCell.swift
//  Trible_New
//
//  Created by Daniel on 2018/12/25.
//  Copyright © 2018年 Daniel. All rights reserved.
//

import UIKit

class MyExperienceListCell: UITableViewCell {

    @IBOutlet private weak var progressView: StarProgressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        progressView.isHidden = false
    }

    override func didMoveToSuperview() {
        if superview != nil {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.progressView.currentValue(37)
            }
        }
    }
    
}
