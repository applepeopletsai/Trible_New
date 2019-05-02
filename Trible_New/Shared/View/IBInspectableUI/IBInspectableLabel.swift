//
//  IBInspectableLabel.swift
//  Trible_New
//
//  Created by Daniel on 2018/10/28.
//  Copyright © 2018年 Daniel. All rights reserved.
//

import UIKit

class IBInspectableLabel: UILabel {
    
    private var originalTextColor: UIColor?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        originalTextColor = self.textColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        originalTextColor = self.textColor
    }
    
    override var text: String? {
        didSet {
            if let t = text {
                if t.count == 0 {
                    showEmptyText()
                } else {
                    self.textColor = originalTextColor
                }
            } else {
                showEmptyText()
            }
        }
    }
    
    @IBInspectable var emptyTextLocalizedKey: String? {
        didSet {
            showEmptyText()
        }
    }
    
    @IBInspectable var emptyTextColor: UIColor? {
        didSet {
            showEmptyText()
        }
    }
    
    @IBInspectable var titleLocalizedKey: String? {
        didSet {
            if let titleLocalizedKey = titleLocalizedKey {
                super.text = LocalizedString(titleLocalizedKey)
            }
        }
    }
    
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
    
    private func showEmptyText() {
        if let emptyTextLocalizedKey = emptyTextLocalizedKey {
            super.text = LocalizedString(emptyTextLocalizedKey)
            self.textColor = emptyTextColor
        }
    }
}
