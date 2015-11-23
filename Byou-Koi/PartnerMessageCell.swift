//
//  PartnerMessageCell.swift
//  Byou-Koi
//
//  Created by 松下慶大 on 2015/11/20.
//  Copyright © 2015年 matsushita keita. All rights reserved.
//

import UIKit

class PartnerMessageCell: UITableViewCell {
    @IBOutlet weak var labelWidthContent: NSLayoutConstraint!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var partnerImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.partnerImageView.makeCircle()
        self.setupMessageLabel()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        messageLabel.sizeToFit()
        print("hoge")
    }
    
    func setupMessageLabel() {
        self.messageLabel.font = UIFont.mainJaFont()
        self.messageLabel.font = UIFont.systemFontOfSize(15)
        self.messageLabel.makeCornerCircle()
        self.messageLabel.numberOfLines = 0
    }
    
    func layoutMessageLabel(maxSize: CGSize) {
        self.messageLabel.sizeToFit()
        let labelSize = self.messageLabel.sizeThatFits(maxSize)
        if labelSize.width < maxSize.width - 100 {
            self.labelWidthContent.constant = labelSize.width + 25
        } else {
            self.labelWidthContent.constant = maxSize.width - 100
        }
    }
}
