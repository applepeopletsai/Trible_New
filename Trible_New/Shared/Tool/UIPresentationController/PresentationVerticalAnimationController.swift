//
//  PresentationVerticalAnimationController.swift
//  Trible_New
//
//  Created by Daniel on 2018/11/13.
//  Copyright © 2018年 Daniel. All rights reserved.
//

import UIKit

class PresentationVerticalAnimationController: BaseAnimationController {
    override func animateTransition(using transitionContext: UIViewControllerContextTransitioning, fromVC: UIViewController, toVC: UIViewController, fromView: UIView, toView: UIView) {
        
        let containerView = transitionContext.containerView
        let isPresenting = toVC.presentingViewController == fromVC
        
        if isPresenting {
            let initialFrame = transitionContext.finalFrame(for: toVC)
            toView.frame = initialFrame.offsetBy(dx: 0, dy: initialFrame.height)
            
            UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
                toView.frame = CGRect(x: initialFrame.origin.x, y: 10, width: initialFrame.size.width, height: initialFrame.size.height)
            }) { finished in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
        } else {
            var finalFrame = fromView.frame
            finalFrame.origin.y = containerView.bounds.height
            
            UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
                fromView.frame = finalFrame
            }, completion: { finished in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            })
        }
    }
}
