//
//  MenuLabel.swift
//  Byou-Koi
//
//  Created by 松下慶大 on 2015/11/16.
//  Copyright © 2015年 matsushita keita. All rights reserved.
//

import UIKit

class MenuLabel: UILabel {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    override func drawTextInRect(rect: CGRect) {
        let insets = UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0)
        super.drawTextInRect(UIEdgeInsetsInsetRect(rect, insets))    }

}
