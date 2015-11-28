//
//  CustomNavigationBar.swift
//  Byou-Koi
//
//  Created by 松下慶大 on 2015/11/15.
//  Copyright © 2015年 matsushita keita. All rights reserved.
//

import UIKit

class CustomNavigationBar: UINavigationBar {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layoutTitle()
        barTintColor = UIColor.mainColor()
        tintColor = UIColor.whiteColor()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func layoutTitle() {
        let attributes = [
            NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSFontAttributeName: UIFont(name: "HirakakuProN-W3", size: 18)!
        ]
        titleTextAttributes = attributes
    }

}
