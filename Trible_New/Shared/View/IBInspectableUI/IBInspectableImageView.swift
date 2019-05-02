//
//  IBInspectableImageView.swift
//  Trible_New
//
//  Created by Daniel on 2019/1/14.
//  Copyright © 2019年 Daniel. All rights reserved.
//

import UIKit

class IBInspectableImageView: UIImageView {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = .white {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
}
