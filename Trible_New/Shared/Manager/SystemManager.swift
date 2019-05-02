//
//  SystemManager.swift
//  Trible_New
//
//  Created by Daniel on 2018/10/17.
//  Copyright © 2018年 Daniel. All rights reserved.
//

import UIKit
import Alamofire
import NVActivityIndicatorView
import SwiftMessages

class SystemManager: NSObject {
    private static let sharedInstance = SystemManager()
    private let networkManager = Alamofire.NetworkReachabilityManager()
    private var networkStatus = ((Alamofire.NetworkReachabilityManager()?.isReachable) ?? false) ? Alamofire.NetworkReachabilityManager.NetworkReachabilityStatus.reachable(.wwan) : Alamofire.NetworkReachabilityManager.NetworkReachabilityStatus.notReachable
    
    // MARK: Alert
    static func showAlertWith(alertTitle: String?,
                              alertMessage: String?,
                              buttonTitle: String,
                              handler: actionHandler?) {
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        
        let button = UIAlertAction(title: buttonTitle, style: .default) { action in
            DispatchQueue.main.async {
                handler?()
            }
        }
        alert.addAction(button)
        
        let vc = SystemManager.topViewController()
        if !vc.isBeingPresented && !vc.isBeingDismissed {
            vc.present(alert, animated: true, completion: nil)
        }
    }
    
    static func showAlertSheetWith(title: String?,
                                   message: String?,
                                   buttonTitles: [String],
                                   actions: [actionHandler?]) {
        if buttonTitles.count != actions.count {
            debugPrint("=== ButtonTitles count is not equal actions count")
            return
        }
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        for i in 0..<buttonTitles.count {
            let buttonTitle = buttonTitles[i]
            let action = actions[i]
            let button = UIAlertAction(title: buttonTitle, style: .default, handler: { _ in
                DispatchQueue.main.async {
                    action?()
                }
            })
            alert.addAction(button)
        }
        
        let cancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        alert.addAction(cancel)
        
        let vc = SystemManager.topViewController()
        if !vc.isBeingPresented && !vc.isBeingDismissed {
            vc.present(alert, animated: true, completion: nil)
        }
    }
    
    static func showTwoButtonAlertWith(alertTitle: String?,
                                       alertMessage: String?,
                                       leftButtonTitle: String,
                                       rightButtonTitle: String,
                                       leftHandler: actionHandler?,
                                       rightHandler: actionHandler?) {
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        
        let leftButton = UIAlertAction(title: leftButtonTitle, style: .default) { _ in
            DispatchQueue.main.async {
                leftHandler?()
            }
        }
        let rightButton = UIAlertAction(title: rightButtonTitle, style: .default) { _ in
            DispatchQueue.main.async {
                rightHandler?()
            }
        }
        alert.addAction(leftButton)
        alert.addAction(rightButton)
        
        let vc = SystemManager.topViewController()
        if !vc.isBeingPresented && !vc.isBeingDismissed {
            vc.present(alert, animated: true, completion: nil)
        }
    }
    
    static func showTimeOutErrorAlert(tryAgainHandler: @escaping actionHandler) {
        SystemManager.hideLoading()
        SystemManager.showAlertWith(alertTitle: LocalizedString("Lang_GE_016"), alertMessage: LocalizedString("Lang_GE_017"), buttonTitle: LocalizedString("Lang_GE_018"), handler: {
            SystemManager.showLoading()
            tryAgainHandler()
        })
    }
    
    static func showErrorAlert(error: Error? = nil, backToLoginVC: Bool = false) {
        SystemManager.hideLoading()
        var errorCode: String?
        if let error = error {
            if let e = error as? AFError {
                switch e {
                case .invalidURL(let url):
                    print("Invalid URL: \(url) - \(e.localizedDescription)")
                    errorCode = "1001"
                    break
                case .parameterEncodingFailed(let reason):
                    print("Parameter encoding failed: \(e.localizedDescription)")
                    print("Failure Reason: \(reason)")
                    switch reason {
                    case .missingURL:
                        errorCode = "1002"
                        break
                    case .jsonEncodingFailed(let error):
                        print("Error: \(error.localizedDescription)")
                        errorCode = "1003"
                        break
                    case .propertyListEncodingFailed(let error):
                        print("Error: \(error.localizedDescription)")
                        errorCode = "1004"
                        break
                    }
                    break
                case .multipartEncodingFailed(let reason):
                    print("Multipart encoding failed: \(e.localizedDescription)")
                    print("Failure Reason: \(reason)")
                    switch reason {
                    case .bodyPartFileIsDirectory(let url):
                        print("URL: \(url)")
                        errorCode = "1005"
                        break
                    case .bodyPartURLInvalid(let url):
                        print("URL: \(url)")
                        errorCode = "1006"
                        break
                    case .bodyPartFilenameInvalid(let url):
                        print("URL: \(url)")
                        errorCode = "1007"
                        break
                    case .bodyPartFileNotReachable(let url):
                        print("URL: \(url)")
                        errorCode = "1008"
                        break
                    case .bodyPartFileNotReachableWithError(let url, let error):
                        print("URL: \(url)")
                        print("Error: \(error.localizedDescription)")
                        errorCode = "1009"
                        break
                    case .bodyPartFileSizeNotAvailable(let url):
                        print("URL: \(url)")
                        errorCode = "1010"
                        break
                    case .bodyPartFileSizeQueryFailedWithError(let url, let error):
                        print("URL: \(url)")
                        print("Error: \(error.localizedDescription)")
                        errorCode = "1011"
                        break
                    case .bodyPartInputStreamCreationFailed(let url):
                        print("URL: \(url)")
                        errorCode = "1012"
                        break
                    case .outputStreamCreationFailed(let url):
                        print("URL: \(url)")
                        errorCode = "1013"
                        break
                    case .outputStreamFileAlreadyExists(let url):
                        print("URL: \(url)")
                        errorCode = "1014"
                        break
                    case .outputStreamURLInvalid(let url):
                        print("URL: \(url)")
                        errorCode = "1015"
                        break
                    case .outputStreamWriteFailed(let error):
                        print("Error: \(error.localizedDescription)")
                        errorCode = "1016"
                        break
                    case .inputStreamReadFailed(let error):
                        print("Error: \(error.localizedDescription)")
                        errorCode = "1017"
                        break
                    }
                    break
                case .responseValidationFailed(let reason):
                    print("Response validation failed: \(e.localizedDescription)")
                    
                    switch reason {
                    case .dataFileNil, .dataFileReadFailed:
                        print("Downloaded file could not be read")
                        errorCode = "1018"
                        break
                    case .missingContentType(let acceptableContentTypes):
                        print("Content Type Missing: \(acceptableContentTypes)")
                        errorCode = "1019"
                        break
                    case .unacceptableContentType(let acceptableContentTypes, let responseContentType):
                        print("Response content type: \(responseContentType) was unacceptable: \(acceptableContentTypes)")
                        errorCode = "1020"
                        break
                    case .unacceptableStatusCode(let code):
                        print("Response status code was unacceptable: \(code)")
                        errorCode = "1021(\(code))"
                        break
                    }
                    break
                case .responseSerializationFailed(let reason):
                    print("Response serialization failed: \(e.localizedDescription)")
                    print("Failure Reason: \(reason)")
                    switch reason {
                    case .inputDataNil:
                        errorCode = "1022"
                        break
                    case .inputDataNilOrZeroLength:
                        errorCode = "1023"
                        break
                    case .inputFileNil:
                        errorCode = "1024"
                        break
                    case .inputFileReadFailed(let url):
                        print("URL: \(url)")
                        errorCode = "1025"
                        break
                    case .stringSerializationFailed(let encoding):
                        print("Encoding: \(encoding)")
                        errorCode = "1026"
                        break
                    case .jsonSerializationFailed(let error):
                        print("Error: \(error.localizedDescription)")
                        errorCode = "1027"
                        break
                    case .propertyListSerializationFailed(let error):
                        print("Error: \(error.localizedDescription)")
                        errorCode = "1028"
                        break
                    }
                    break
                }
                print("Underlying error: \(String(describing: e.underlyingError))")
            } else if let e = error as? URLError {
                /* -1005參考：
                 https://stackoverflow.com/a/25996971/7103908
                 http://blog.harrisonxi.com/2017/03/NSURLErrorDomain%E7%9A%84-1005%E9%94%99%E8%AF%AF.html
                 https://developer.apple.com/documentation/cfnetwork/cfnetworkerrors
                 */
                errorCode = "2001(\(e._code))"
                print("URLError occurred: \(e)")
            } else {
                errorCode = "3001(\(error._code))"
                print("Unknown error: \(error)")
            }
        }
        
        DispatchQueue.main.async {
            let alertMessage = (errorCode != nil) ? "\(LocalizedString("Lang_GE_020")):\(errorCode!)" : nil
            SystemManager.showAlertWith(alertTitle: LocalizedString("Lang_GE_021"), alertMessage: alertMessage, buttonTitle: LocalizedString("Lang_GE_022"), handler: {
                if backToLoginVC {
//                    SystemManager.backToLoginVC()
                }
            })
        }
    }
    
    // MARK: Network
    static func startNetworkMonitoring() {
        SystemManager.sharedInstance.networkManager?.startListening()
        SystemManager.sharedInstance.networkManager?.listener = { status in
            switch status {
            case .notReachable:
                if SystemManager.sharedInstance.networkStatus != .notReachable {
                    SystemManager.showNotReachableNetworkBanner()
                }
                break
            case .unknown:
                break
            case .reachable(.wwan):
                if SystemManager.sharedInstance.networkStatus == .notReachable {
                    SystemManager.showReachableNetworkBanner()
                    NotificationCenter.postNotification(.NetworkDidRecover)
                }
                break
            case .reachable(.ethernetOrWiFi):
                if SystemManager.sharedInstance.networkStatus == .notReachable {
                    SystemManager.showReachableNetworkBanner()
                    NotificationCenter.postNotification(.NetworkDidRecover)
                }
                break
            }
            SystemManager.sharedInstance.networkStatus = status
        }
    }
    
    static func isNetworkReachable(showBanner: Bool = true) -> Bool {
        if let net = SystemManager.sharedInstance.networkManager {
            if !net.isReachable && showBanner {
                SystemManager.showNotReachableNetworkBanner()
            }
            return net.isReachable
        }
        return false
    }
    
    // MARK: Banner
    static func showReachableNetworkBanner() {
        SystemManager.showTipBannerWith(configureTheme: .success, title: LocalizedString("Lang_GE_023"), body: "", duration: 1.0)
    }
    
    static func showSuccessBanner(title: String, body: String) {
        SystemManager.showTipBannerWith(configureTheme: .success, title: title, body: body, duration: 1.0)
    }
    
    static func showErrorMessageBanner(title: String, body: String) {
        SystemManager.showTipBannerWith(configureTheme: .error, title: title, body: body, duration: 1.0)
    }
    
    static func showWarningBanner(title: String, body: String) {
        SystemManager.showTipBannerWith(configureTheme: .warning, title: title, body: body, duration: 1.0)
    }
    
    private static func showNotReachableNetworkBanner() {
        SystemManager.showTipBannerWith(configureTheme: .error, title: LocalizedString("Lang_GE_019"), body: LocalizedString("Lang_GE_017"), duration: 1.0)
    }
    
    private static func showTipBannerWith(configureTheme: Theme, title: String, body: String, duration: Double) {
        let deleyTime = (SwiftMessages.sharedInstance.current() != nil) ? 0.3 : 0.0
        SwiftMessages.hideAll()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + deleyTime) {
            let view = MessageView.viewFromNib(layout: .cardView)
            view.configureTheme(configureTheme)
            view.configureDropShadow()
            view.configureContent(title: title, body: body)
            view.button?.isHidden = true
            var config = SwiftMessages.Config()
            config.presentationStyle = .top
            config.duration = .seconds(seconds: duration)
            config.interactiveHide = false
            SwiftMessages.show(config: config, view: view)
        }
    }
    
    // MARK: Loading Animation
    static func showLoading(message: String? = "Loading...") {
        let data = ActivityData(size: CGSize(width: 50, height: 50), message: message, messageFont: UIFont.systemFont(ofSize: 13), messageSpacing: 5, type: .ballRotateChase, color: .white, padding: 0, displayTimeThreshold: 0, minimumDisplayTime: 0, backgroundColor: color_000000_05, textColor: .white)
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(data,nil)
    }
    
    static func hideLoading() {
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
    }
    
    static func endLoadingWith<T: Codable>(model: BaseModel<T>?, handler: actionHandler? = nil) {
        hideLoading()
        let title = (model?.Result is String) ? (model?.Result as! String) : LocalizedString("Lang_GE_021")
        let message = (model?.Result is String) ? nil : "\(LocalizedString("Lang_GE_020")):9999"
        SystemManager.showAlertWith(alertTitle: title, alertMessage: message, buttonTitle: LocalizedString("Lang_GE_022"), handler: {
            if model?.HttpStatusCode == 501 {
//                SystemManager.backToLoginVC()
            } else {
                handler?()
            }
        })
    }
    
    // MARK: TabBar Select Index
    static func changeTabBarSelectIndexTo(_ index: Int) {
        let naviVC = UIApplication.shared.delegate?.window??.rootViewController as? UINavigationController
        let tabVC = naviVC?.visibleViewController as? CustomTabBarController
        tabVC?.changeSelectIndexTo(index)
    }
    
    // MARK: TopViewController
    static func topViewController() -> UIViewController {
        var vc = UIApplication.shared.keyWindow?.rootViewController
        
        if vc == nil, let window = UIApplication.shared.delegate?.window {
            vc = window?.rootViewController
        }
        
        guard vc != nil else {
            debugPrint("could not found topViewController")
            return UIViewController()
        }
        
        if vc!.isKind(of: UINavigationController.self), let naviVC = vc as? UINavigationController {
            vc = naviVC.visibleViewController
        }
        
        if vc!.isKind(of: UITabBarController.self), let tabVC = vc as? UITabBarController {
            vc = tabVC.selectedViewController
        }
        
        if vc!.isKind(of: UINavigationController.self), let naviVC = vc as? UINavigationController {
            vc = naviVC.visibleViewController
        }
        
        while vc?.presentedViewController != nil {
            vc = vc?.presentedViewController
        }
        
        if vc!.isKind(of: UIAlertController.self) {
            vc = vc?.presentingViewController
        }
        
        return vc!
    }
}
