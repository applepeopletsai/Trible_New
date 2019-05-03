//
//  MessageListCell.swift
//  Trible_New
//
//  Created by Daniel on 2019/5/3.
//  Copyright © 2019 Daniel. All rights reserved.
//

import UIKit

class MessageListCell: UITableViewCell {

    @IBOutlet private weak var headerImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var contentLabel: UILabel!
    @IBOutlet private weak var activityNameLabel: UILabel!
    @IBOutlet private weak var activityTimeLabel: UILabel!
    @IBOutlet private weak var messageTimeLabel: UILabel!
    @IBOutlet private weak var messageCountLabel: UILabel!
    @IBOutlet private weak var statusLabel: UILabel!
    @IBOutlet private weak var messageCountLabelWidth: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configuteCell() {
//        self.messageCountLabel.text = (self.badge > 99) ? "99+" : String(self.badge)
        
        //調整messageCountLabel寬度
        let width = (self.messageCountLabel.intrinsicContentSize.width + 5) > 20 ? self.messageCountLabel.intrinsicContentSize.width + 5 : 20
        self.messageCountLabelWidth.constant = width
    }

}
