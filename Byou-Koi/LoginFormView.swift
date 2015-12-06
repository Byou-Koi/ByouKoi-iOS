//
//  LoginFormView.swift
//  Byou-Koi
//
//  Created by 松下慶大 on 2015/11/29.
//  Copyright © 2015年 matsushita keita. All rights reserved.
//

import UIKit

class LoginFormView: UIView, UITextFieldDelegate, UIGestureRecognizerDelegate {
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var formViewWidth: NSLayoutConstraint!
    @IBOutlet weak var formViewMarginTop: NSLayoutConstraint!

    @IBOutlet weak var passTextField: UITextField!

    @IBOutlet weak var loginStartButton: UIButton!
    @IBOutlet weak var effectView: UIVisualEffectView!

    
    class func instance() -> LoginFormView {
        return UINib(nibName: "LoginFormView", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! LoginFormView
    }
    
    override func drawRect(rect: CGRect) {
        
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserver(self, selector: "showKeyboard:", name: UIKeyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: "hideKeyboard:", name: UIKeyboardWillHideNotification, object: nil)
        
        mailTextField.delegate = self
        passTextField.delegate = self
        
        formViewWidth.constant = self.frame.width - 40
        animationMainView()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: "tapBackgroundView:")
        tapGesture.delegate = self
        self.addGestureRecognizer(tapGesture)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func showKeyboard(notification: NSNotification) {
        UIView.animateWithDuration(0.5) { () -> Void in
            if self.frame.height >= 700 {
                self.formViewMarginTop.constant = 50
            } else if self.frame.height >= 600 {
                self.formViewMarginTop.constant = 0
            } else {
                self.formViewMarginTop.constant = -127
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
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldReceiveTouch touch: UITouch) -> Bool {
        if touch.view == self.mainView {
            return false
        } else {
            return true
        }
    }
    
    func tapBackgroundView(gestureRecognizer: UITapGestureRecognizer) {
        removeFromSuperview()
    }
    
    func animationMainView() {
        effectView.alpha = 0.0
        mainView.center.y += 30
        UIView.animateWithDuration(0.5) { () -> Void in
            self.mainView.center.y -= 30
            self.effectView.alpha = 1.0
        }
    }

    
}
