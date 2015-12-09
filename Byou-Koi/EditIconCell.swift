//
//  EditIconCell.swift
//  Byou-Koi
//
//  Created by 松下慶大 on 2015/12/10.
//  Copyright © 2015年 matsushita keita. All rights reserved.
//

import UIKit

class EditIconCell: UITableViewCell {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var editIconButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        layoutIconImageView()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func layoutIconImageView() {
        self.iconImageView.makeCircle()
    }
    
}
