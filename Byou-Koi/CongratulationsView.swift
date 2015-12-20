//
//  CongratulationsView.swift
//  Byou-Koi
//
//  Created by 松下慶大 on 2015/12/19.
//  Copyright © 2015年 matsushita keita. All rights reserved.
//

import UIKit

class CongratulationsView: UIView {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var iconImageView: UIImageView!

    
    class func instance() -> CongratulationsView {
        return UINib(nibName: "CongratulationsView", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! CongratulationsView
    }
    

    override func drawRect(rect: CGRect) {
        iconImageView.makeCircle()
        iconImageView.lineWhiteBorder()
        iconImageView.layer.borderWidth = 3
        backButton.makeCornerCircle()
    }

}
