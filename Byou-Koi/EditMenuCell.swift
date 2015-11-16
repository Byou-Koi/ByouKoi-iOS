//
//  EditMenuCell.swift
//  Byou-Koi
//
//  Created by 松下慶大 on 2015/11/17.
//  Copyright © 2015年 matsushita keita. All rights reserved.
//

import UIKit

class EditMenuCell: UITableViewCell {
    @IBOutlet weak var menuLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        menuLabel.font = UIFont.mainJaFont()
        menuLabel.font = UIFont.systemFontOfSize(15)
        menuLabel.textColor = UIColor.mainTextColor()
        self.accessoryType = .DisclosureIndicator
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
