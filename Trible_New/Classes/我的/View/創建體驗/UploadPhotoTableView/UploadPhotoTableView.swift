//
//  UploadPhotoTableView.swift
//  Trible_New
//
//  Created by Daniel on 2019/1/14.
//  Copyright © 2019年 Daniel. All rights reserved.
//

import UIKit

enum UploadPhotoTableViewType {
    case CoverPhoto     // 封面照，上限1張
    case ContentPhoto   // 內容照，上限10張
}

class UploadPhotoTableView: UITableView {
    
    @IBInspectable var UploadPhotoTableViewTypeString: String = "CoverPhoto" {
        didSet {
            switch UploadPhotoTableViewTypeString {
            case "CoverPhoto":
                type = .CoverPhoto
                maxSelectCount = 1
                break
            case "ContentPhoto":
                type = .ContentPhoto
                maxSelectCount = 10
                break
            default: break
            }
        }
    }
    
    private var type: UploadPhotoTableViewType = .CoverPhoto
    private var maxSelectCount = 1
    private var photoArray = [ImageAsset]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureTableView()
    }
    
    func configureTableView(maxSelectCount: Int) {
        self.maxSelectCount = maxSelectCount
    }
    
    private func configureTableView() {
        self.dataSource = self
        self.delegate = self
        self.register(UINib(nibName: String(describing: UploadPhotoCell.self), bundle: nil), forCellReuseIdentifier: UploadPhotoCell.identifier)
    }
}

extension UploadPhotoTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (photoArray.count == maxSelectCount) ? photoArray.count : photoArray.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UploadPhotoCell.self), for: indexPath) as! UploadPhotoCell
        cell.configureCellWith(imageAssets: photoArray, maxSelectCount: maxSelectCount, indexPath: indexPath, delegate: self)
        return cell
    }
}

extension UploadPhotoTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }
}

extension UploadPhotoTableView: UploadPhotoCellDelegate {
    func didSelectImage(images: [ImageAsset]) {
        self.photoArray = images
        self.reloadData()
    }
    
    func didCancel() {
        
    }
}
