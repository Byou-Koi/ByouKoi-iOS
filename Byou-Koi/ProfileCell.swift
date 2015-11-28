//
//  ProfileCell.swift
//  Byou-Koi
//
//  Created by 松下慶大 on 2015/11/15.
//  Copyright © 2015年 matsushita keita. All rights reserved.
//

import UIKit

class ProfileCell: UITableViewCell {
    @IBOutlet weak var iconImageView: UIImageView!

    override func awakeFromNib() {
        iconImageView.makeCircle()
    }
}
