//
//  SentimentView.swift
//  Byou-Koi
//
//  Created by 松下慶大 on 2015/12/24.
//  Copyright © 2015年 matsushita keita. All rights reserved.
//

import UIKit

class SentimentView: UIView {

    class func instance() -> SentimentView {
        return UINib(nibName: "SentimentView", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! SentimentView
    }
    
    override func drawRect(rect: CGRect) {

    }
}
