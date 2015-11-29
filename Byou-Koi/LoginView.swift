//
//  LoginView.swift
//  Byou-Koi
//
//  Created by 松下慶大 on 2015/11/28.
//  Copyright © 2015年 matsushita keita. All rights reserved.
//

import UIKit

class LoginView: UIView {
    @IBOutlet weak var loginButtonWidth: NSLayoutConstraint!
    @IBOutlet weak var signUpButtonWidth: NSLayoutConstraint!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    class func instance() -> LoginView {
        return UINib(nibName: "LoginView", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! LoginView
    }

    override func drawRect(rect: CGRect) {
        setUpButtons()
    }
    
    func setUpButtons() {
        loginButton.lineWhiteBorder()
//        loginButton.makeCornerCircle()
        signUpButton.lineWhiteBorder()
//        signUpButton.makeCornerCircle()
//        signUpButtonWidth.constant = (self.frame.width - 60) / 2
//        loginButtonWidth.constant = (self.frame.width - 60) / 2
    }


}
