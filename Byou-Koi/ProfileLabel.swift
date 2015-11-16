//
//  ProfileLabel.swift
//  Byou-Koi
//
//  Created by 松下慶大 on 2015/11/17.
//  Copyright © 2015年 matsushita keita. All rights reserved.
//

import UIKit

class ProfileLabel: UILabel {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.font = UIFont.mainJaFont()
        self.font = UIFont.systemFontOfSize(15)
    }
    
    override func drawTextInRect(rect: CGRect) {
        let insets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        super.drawTextInRect(UIEdgeInsetsInsetRect(rect, insets))
    }

}
