//
//  MultipleSelectImageViewController.swift
//  Trible_New
//
//  Created by Daniel on 2019/1/17.
//  Copyright © 2019年 Daniel. All rights reserved.
//

import UIKit
import DKImagePickerController
import Photos

class ImageAsset: DKAsset {
    var originalImage: UIImage?
    
    override init(originalAsset: PHAsset) {
        super.init(originalAsset: originalAsset)
    }
    
    override init(image: UIImage) {
        super.init(image: image)
    }
    
    static func transferToImageAssets(DKAssets: [DKAsset], complection: @escaping([ImageAsset]) -> Void) {
        var array: [ImageAsset] = []
        for asset in DKAssets {
            if let originalAsset = asset.originalAsset {
                let imageAsset = ImageAsset(originalAsset: originalAsset)
                
                imageAsset.fetchOriginalImage(completeBlock: { (image, info) in
                    imageAsset.originalImage = image
                    array.append(imageAsset)
                    
                    if array.count == DKAssets.count {
                        complection(array)
                    }
                })
            }
        }
    }
}

protocol MultipleSelectImageViewControllerDelegate: class {
    func didSelectAssets(_ assets: [ImageAsset])
    func didCancel()
}

class MultipleSelectImageViewController: DKImagePickerController {
    
    var didSelectImage: ((_ assets: [ImageAsset]) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.didSelectAssets = { (assets: [DKAsset]) in
            ImageAsset.transferToImageAssets(DKAssets: assets, complection: { (imageAssets) in
                self.didSelectImage?(imageAssets)
            })
        }
    }

    override func canSelect(asset: DKAsset, showAlert: Bool) -> Bool {
        if self.maxSelectableCount == 1 {
            super.deselectAll()
        }
        
        if self.maxSelectableCount > 0 {
            let shouldSelect = self.selectedAssetIdentifiers.count < self.maxSelectableCount
            return shouldSelect
        }
        return true
    }
}
