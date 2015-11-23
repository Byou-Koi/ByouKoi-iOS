//
//  MyMessageCell.swift
//  Byou-Koi
//
//  Created by 松下慶大 on 2015/11/20.
//  Copyright © 2015年 matsushita keita. All rights reserved.
//

import UIKit

class MyMessageCell: UITableViewCell {
    @IBOutlet weak var labelWidthContent: NSLayoutConstraint!
    @IBOutlet weak var messageLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupMessageLabel()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupMessageLabel() {
        self.messageLabel.font = UIFont.mainJaFont()
        self.messageLabel.makeCornerCircle()
        self.messageLabel.font = UIFont.systemFontOfSize(15)
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
