//
//  UploadPhotoCell.swift
//  Trible_New
//
//  Created by Daniel on 2019/1/14.
//  Copyright © 2019年 Daniel. All rights reserved.
//

import UIKit

protocol UploadPhotoCellDelegate: class {
    func didSelectImage(images: [ImageAsset])
    func didCancel()
}

class UploadPhotoCell: UITableViewCell {

    @IBOutlet private weak var photoImageView: UIImageView!
    @IBOutlet private weak var addButton: UIButton!
    
    private var selectImageAssets: [ImageAsset]?
    private var maxSelectCount = 1
    private var indexPath: IndexPath?
    private weak var delegate: UploadPhotoCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCellWith(imageAssets: [ImageAsset], maxSelectCount: Int, indexPath: IndexPath, delegate: UploadPhotoCellDelegate) {
        self.selectImageAssets = imageAssets
        self.maxSelectCount = maxSelectCount
        self.indexPath = indexPath
        self.delegate = delegate
        
        let showAddButton = imageAssets.count != maxSelectCount
        let imageIndex = (showAddButton) ? indexPath.row - 1 : indexPath.row
        
        if indexPath.row == 0 && showAddButton {
            self.addButton.isHidden = false
            self.photoImageView.isHidden = true
        } else {
            self.addButton.isHidden = true
            self.photoImageView.isHidden = false
            self.photoImageView.image = nil
            
            self.photoImageView.image = imageAssets[imageIndex].originalImage
        }
    }
    
    private func showImagePicker() {
        PresentationTool.showImagePickerWith(selectAssets: selectImageAssets, maxSelectCount: maxSelectCount, didSelectImage: { (imageAssets) in
            self.delegate?.didSelectImage(images: imageAssets)
        }, didCancel: {
            self.delegate?.didCancel()
        })
    }
    
    @IBAction private func addButtonPress(_ sender: UIButton) {
        showImagePicker()
    }
    
    @IBAction private func imageDidPress(_ sender: UIButton) {
        showImagePicker()
    }
}
