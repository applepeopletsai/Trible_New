//
//  BaseViewController.swift
//  Trible_New
//
//  Created by Daniel on 2018/10/17.
//  Copyright © 2018年 Daniel. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    lazy private var maskView: UIView = {
        let mask = UIView(frame: CGRect(origin: CGPoint.zero, size: screenSize))
        mask.backgroundColor = .white
        return mask
    }()
    
    override var prefersStatusBarHidden: Bool { return false }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        addObserver()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: Method
    private func addObserver() {
        NotificationCenter.addObserver(self, selector: #selector(networkDidRecover), notification: .NetworkDidRecover)
        NotificationCenter.addObserver(self, selector: #selector(applicationDidBecomeActive), notification: .ApplicationDidBecomeActive)
        NotificationCenter.default.addObserver(self, selector: #selector(statusBarFrameChanged(_:)), name: UIApplication.willChangeStatusBarFrameNotification, object: nil)
    }
    
    @objc private func networkDidRecover() {
        if type(of: SystemManager.topViewController()) == type(of: self) {
            handleNetworkDidRecover()
        }
    }
    func handleNetworkDidRecover() {}
    
    @objc private func applicationDidBecomeActive() {
        if type(of: SystemManager.topViewController()) == type(of: self) {
            handleApplicationDidBecomeActive()
        }
    }
    func handleApplicationDidBecomeActive() {}
    
    @objc private func statusBarFrameChanged(_ notification: NSNotification) {
        if let userInfo = notification.userInfo, let statusBarFrame = userInfo["UIApplicationStatusBarFrameUserInfoKey"] as? CGRect, type(of: SystemManager.topViewController()) == type(of: self)  {
            handleStatusBarFrameChanged(frame: statusBarFrame)
        }
    }
    func handleStatusBarFrameChanged(frame: CGRect) {}
    
    func addMaskView() {
        maskView.alpha = 1.0
        view.addSubview(maskView)
    }
    
    func removeMaskView() {
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn, animations: {
            self.maskView.alpha = 0.0
        }) { (finished) in
            self.maskView.removeFromSuperview()
        }
    }
    
    func constraintAnimation(duration: TimeInterval, completion: actionHandler?) {
        UIView.animate(withDuration: duration, animations: {
            self.view.layoutIfNeeded()
        }, completion: { (finished) in
            if finished { completion?() }
        })
    }

    // MARK: Event Handler
    @IBAction private func backButtonPress(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func dismissButtonPress(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
