//
//  ExperienceHomeCollectionViewCell_Normal.swift
//  TribleHome
//
//  Created by Daniel on 2018/10/9.
//  Copyright © 2018年 Daniel. All rights reserved.
//

import UIKit

class ExperienceHomeCollectionViewCell_Normal: UICollectionViewCell {

    @IBOutlet private weak var photoImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.makeShadowAndCornerRadius()
    }

}

