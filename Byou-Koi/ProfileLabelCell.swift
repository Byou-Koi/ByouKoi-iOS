//
//  EditMenuCell.swift
//  Byou-Koi
//
//  Created by 松下慶大 on 2015/11/17.
//  Copyright © 2015年 matsushita keita. All rights reserved.
//

import UIKit

class ProfileLabelCell: UITableViewCell {
    @IBOutlet weak var editLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        editLabel.font = UIFont.mainJaFont()
        editLabel.font = UIFont.systemFontOfSize(15)
        editLabel.textColor = UIColor.mainTextColor()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
