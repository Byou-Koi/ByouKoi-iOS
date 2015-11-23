//
//  MessageLabel.swift
//  Byou-Koi
//
//  Created by 松下慶大 on 2015/11/23.
//  Copyright © 2015年 matsushita keita. All rights reserved.
//

import UIKit

class MessageLabel: UILabel {
    
    // paddingの値
    let padding = UIEdgeInsets(top: 8, left: 10, bottom: 8, right: 10)
    
    override func drawTextInRect(rect: CGRect) {
        let newRect = UIEdgeInsetsInsetRect(rect, padding)
        super.drawTextInRect(newRect)
    }
    
    override func intrinsicContentSize() -> CGSize {
        var intrinsicContentSize = super.intrinsicContentSize()
        intrinsicContentSize.height += padding.top + padding.bottom
        intrinsicContentSize.width += padding.left + padding.right
        return intrinsicContentSize
    }
}
