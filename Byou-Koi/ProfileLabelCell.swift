//
//  EditMenuCell.swift
//  Byou-Koi
//
//  Created by 松下慶大 on 2015/11/17.
//  Copyright © 2015年 matsushita keita. All rights reserved.
//

import UIKit

class ProfileLabelCell: UITableViewCell {
    @IBOutlet weak var editProfileButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
       
        layoutEditProfileButton()
    }
    
    func layoutEditProfileButton() {
        editProfileButton.makeCornerCircle()
        editProfileButton.lineMainColorBorder()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
