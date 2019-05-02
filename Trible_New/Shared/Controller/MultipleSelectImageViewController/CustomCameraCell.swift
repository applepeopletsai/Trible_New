//
//  CustomCameraCell.swift
//  Trible_New
//
//  Created by Daniel on 2019/1/17.
//  Copyright © 2019年 Daniel. All rights reserved.
//

import UIKit
import DKImagePickerController

class CustomCameraCell: DKAssetGroupDetailBaseCell {
    class override func cellReuseIdentifier() -> String {
        return "CustomGroupDetailCameraCell"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .black
        
        let cameraImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 32, height: 26))
        cameraImageView.image = UIImage.init(named: "ic_camera")
        cameraImageView.center = self.center
        self.contentView.addSubview(cameraImageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
