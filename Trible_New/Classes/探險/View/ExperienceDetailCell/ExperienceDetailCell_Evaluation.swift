//
//  ExperienceDetailCell_Evaluation.swift
//  ExperienceDetail
//
//  Created by Daniel on 2018/11/7.
//  Copyright © 2018年 Daniel. All rights reserved.
//

import UIKit

class ExperienceDetailCell_Evaluation: UITableViewCell {

    @IBOutlet private weak var headerImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var evaluationLabel: UILabel!
    @IBOutlet private weak var bottomLine: UIView!
    @IBOutlet private weak var titleLabelHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCellWith(indexPath: IndexPath) {
        self.bottomLine.isHidden = !(indexPath.row == 2)
        
        if indexPath.row != 0 {
            self.titleLabelHeight.constant = 0
        }
        
        if indexPath.row % 2 == 0 {
            self.evaluationLabel.text = "評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價"
        } else {
            self.evaluationLabel.text = "評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價評價"
        }
    }
    
}
