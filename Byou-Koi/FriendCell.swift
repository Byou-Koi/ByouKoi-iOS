//
//  FriendCell.swift
//  Byou-Koi
//
//  Created by 松下慶大 on 2015/11/26.
//  Copyright © 2015年 matsushita keita. All rights reserved.
//

import UIKit

class FriendCell: UITableViewCell {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        iconImageView.makeCircle()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
