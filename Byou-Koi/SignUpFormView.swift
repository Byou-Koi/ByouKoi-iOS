//
//  SignUpFormView.swift
//  Byou-Koi
//
//  Created by 松下慶大 on 2015/11/29.
//  Copyright © 2015年 matsushita keita. All rights reserved.
//

import UIKit

class SignUpFormView: UIView, UITextFieldDelegate {
    @IBOutlet weak var formViewMarginTop: NSLayoutConstraint!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var effectView: UIVisualEffectView!
    @IBOutlet weak var signUpButton: UIButton!

    class func instance() -> SignUpFormView {
        return UINib(nibName: "SignUpFormView", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! SignUpFormView
    }
    
    
    
    override func drawRect(rect: CGRect) {
        
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserver(self, selector: "showKeyboard:", name: UIKeyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: "hideKeyboard:", name: UIKeyboardWillHideNotification, object: nil)
        
        nameTextField.delegate = self
        passTextField.delegate = self
        
        effectView.alpha = 0.0
        UIView.animateWithDuration(0.5) { () -> Void in
            self.effectView.alpha = 1.0
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func showKeyboard(notification: NSNotification) {
        UIView.animateWithDuration(0.5) { () -> Void in
            if self.frame.height >= 700 {
                self.formViewMarginTop.constant = 0
            } else if self.frame.height >= 600 {
                self.formViewMarginTop.constant = -128
            } else {
                self.formViewMarginTop.constant = -130
            }
            self.layoutIfNeeded()
            
        }
    }
    
    func hideKeyboard(notification: NSNotification) {
        UIView.animateWithDuration(0.5) { () -> Void in
            self.formViewMarginTop.constant = 50
            self.layoutIfNeeded()
        }
    }

}
