//
//  PresentationTool.swift
//  Trible_New
//
//  Created by Daniel on 2018/11/13.
//  Copyright © 2018年 Daniel. All rights reserved.
//

import UIKit

class PresentationTool {
   
    static func showCalendarWith(canSelectDayArray: [Date]?, canNotSelectDayArray: [Date]?, cancelAction: actionHandler?, confirmAction: @escaping selectDateHandler) {
        let vc = UIStoryboard(name: kStoryBoard_Shared, bundle: nil).instantiateViewController(withIdentifier: String(describing: SelectDateViewController.self)) as! SelectDateViewController
        let width: CGFloat = screenWidth - 10.0 * 2 - 25.0 * 2
        let margin: CGFloat = 3.0 // 日曆與左右邊界的距離
        let cellSpace: CGFloat = margin * 2 // 每個item左右的距離(item上下距離為0)
        let cellWidth = (width - (margin * 2 + cellSpace * 6)) / 7 // 計算每個cell的寬度
        let height: CGFloat = cellWidth * 6 + (10 + 50) + (30 + 10) + (40) + 1
        vc.setupVCWith(canSelectDayArray: canSelectDayArray, canNotSelectDayArray: canNotSelectDayArray, cancelAction: cancelAction, confirmAction: confirmAction)
        AlertPresentationController(presentedViewController: vc, presenting: SystemManager.topViewController()).present(height: height)
    }
    
    static func showSelectPeopleCountWith(cancelAction: actionHandler?, confirmAction: @escaping selectPeopleCountHandlr) {
        let vc = UIStoryboard(name: kStoryBoard_Shared, bundle: nil).instantiateViewController(withIdentifier: String(describing: SelectPeopleCountViewController.self)) as! SelectPeopleCountViewController
        AlertPresentationController(presentedViewController: vc, presenting: SystemManager.topViewController()).present(height: 200)
    }
    
    static func showPickerWith(itemArray: Array<String>?, selectedIndex: Int, hintTitle: String? = nil, cancelAction: actionHandler?, confirmAction: @escaping pickerConfirmHandler) {
        let vc = UIStoryboard(name: "Shared", bundle: nil).instantiateViewController(withIdentifier: String(describing: PickerViewController.self)) as! PickerViewController
        vc.setupVCWith(itemArray: itemArray, selectedIndex: selectedIndex, hintTitle: hintTitle, cancelAction: cancelAction, confirmAction: confirmAction)
        
        let height = (UIDevice().type == .iPhone5) ? screenHeight * 0.4 : screenHeight * 0.35
        VerticalPresentationController(presentedViewController: vc, presenting: SystemManager.topViewController()).present(height: height)
    }
    
    static func showImagePickerWith(selectAssets: [ImageAsset]?, maxSelectCount: Int = 10, didSelectImage: ((_ assets: [ImageAsset]) -> Void)?, didCancel: (() -> Void)?) {
        let pickerController = MultipleSelectImageViewController()
        pickerController.UIDelegate = CustomUIDelegate()
        pickerController.showsCancelButton = true
        pickerController.showsEmptyAlbums = false
        pickerController.assetType = .allPhotos
        pickerController.maxSelectableCount = maxSelectCount
        pickerController.didSelectImage = didSelectImage
        pickerController.didCancel = didCancel
        
        if let selectAssets = selectAssets {
            pickerController.select(assets: selectAssets)
        }
        
        SystemManager.topViewController().present(pickerController, animated: true, completion: nil)
    }
}

