//
//  ExtensionUIView.swift
//  Trible_New
//
//  Created by Daniel on 2019/4/29.
//  Copyright © 2019 Daniel. All rights reserved.
//

import UIKit

extension UIView {
    var parentViewController: UIViewController? {
        for responder in sequence(first: self, next: {$0.next}) {
            if let vc = responder as? UIViewController {
                return vc
            }
        }
        return nil
    }
    
    func removeAllSubviews() {
        for subview in self.subviews {
            subview.removeFromSuperview()
        }
    }
    
    func removeAllSublayers() {
        for sublayer in self.layer.sublayers ?? [] {
            sublayer.removeFromSuperlayer()
        }
    }
}
