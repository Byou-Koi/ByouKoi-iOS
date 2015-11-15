//
//  UIView+Extension.swift
//  Byou-Koi
//
//  Created by 松下慶大 on 2015/11/15.
//  Copyright © 2015年 matsushita keita. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func makeCircle() {
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.masksToBounds = true
    }
    
    func makeCornerCircle() {
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
    }
    
    //[.TopLeft, .TopRight, .BottomLeft, .BottomRight]
    func roudConers(corners: UIRectCorner, radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.CGPath
        self.layer.mask = maskLayer
    }
}
