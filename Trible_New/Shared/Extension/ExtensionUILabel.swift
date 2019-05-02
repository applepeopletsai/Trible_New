//
//  ExtensionUILabel.swift
//  Trible_New
//
//  Created by Daniel on 2019/4/29.
//  Copyright © 2019 Daniel. All rights reserved.
//

import UIKit

extension UILabel {
    private struct AssociatedKeys {
        static var textArray = "textArray"
        static var actionArray = "actionArray"
    }
    
    private var textArray: [String] {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.textArray) as? [String] ?? []
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.textArray, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    private var actionArray: [actionHandler?] {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.actionArray) as? [actionHandler?] ?? []
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.actionArray, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func addUnderLineWith(labelText: String, textArray: [String], colorArray: [UIColor], actionArray: [actionHandler?]?) {
        let attributedText = NSMutableAttributedString(string: labelText)
        if let font = self.font {
            attributedText.addAttribute(NSAttributedString.Key.font, value: font, range: NSRange(location: 0, length: labelText.count))
        }
        
        for i in 0..<textArray.count {
            let text = textArray[i]
            
            guard let nsRange = labelText.range(of: text) else { continue }
            
            let range = NSRange(nsRange, in: text)
            var color = UIColor.red
            if colorArray.count > 0 {
                var j = i
                while j > colorArray.count - 1 {
                    j -= 1
                }
                color = colorArray[j]
            }
            
            attributedText.addAttribute(NSAttributedString.Key.underlineStyle , value: NSUnderlineStyle.single.rawValue, range: range)
            attributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        }
        
        self.attributedText = attributedText
        self.textArray = textArray
        
        guard let actionArray = actionArray else { return }
        self.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap(_:)))
        self.addGestureRecognizer(gestureRecognizer)
        self.actionArray = actionArray
    }
    
    @objc private func tap(_ gesture: UITapGestureRecognizer) {
        for i in 0..<textArray.count {
            if gesture.didTapSpecificText(text: textArray[i], onLabel: self) {
                if actionArray.count > 0 && i < actionArray.count {
                    guard let actionHandler = actionArray[i] else { continue }
                    actionHandler()
                }
                break
            }
        }
    }
}
