//
//  LoginViewController.swift
//  Byou-Koi
//
//  Created by 松下慶大 on 2015/11/28.
//  Copyright © 2015年 matsushita keita. All rights reserved.
//

import UIKit
import SwiftyJSON

class LoginViewController: UIViewController {

    var loginView: LoginView!
    var loginFormView: LoginFormView!
    var signUpFormView: SignUpFormView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginView = LoginView.instance()
        loginView.frame = self.view.frame
        loginView.loginButton.addTarget(self, action: "tapLoginButton:", forControlEvents: .TouchUpInside)
        loginView.signUpButton.addTarget(self, action: "tapSignUpButton:", forControlEvents: .TouchUpInside)
        self.view.addSubview(loginView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tapLoginButton(sender: UIButton) {
        loginFormView = LoginFormView.instance()
        loginFormView.frame = self.view.frame
        loginFormView.loginStartButton.addTarget(self, action: "startLogin:", forControlEvents: .TouchUpInside)
        self.view.addSubview(loginFormView)
    }
    

    func tapSignUpButton(sender: UIButton) {
        signUpFormView = SignUpFormView.instance()
        signUpFormView.frame = self.view.frame
        signUpFormView.signUpButton.addTarget(self, action: "startSignUp:", forControlEvents: .TouchUpInside)
        self.view.addSubview(signUpFormView)
    }
    
    func startLogin(sender: UIButton) {
        
        let mail = loginFormView.mailTextField.text
        let pass = loginFormView.passTextField.text
        
        let attributes: JSON = ["email": mail!, "pass": pass!]
        let user = User(attributes: attributes)
        user.login { (message) -> Void in
            if let msg = message {
                self.showAlert(msg)
                return
            }
        }
        self.loginFormView.removeFromSuperview()
        dismissViewControllerAnimated(true, completion: nil)

    }
    
    func startSignUp(sender: UIButton) {
        
        let name = signUpFormView.nameTextField.text
        let mail = signUpFormView.mailTextField.text
        let pass = signUpFormView.passTextField.text
        
        let attributes: JSON = ["name": name!, "email": mail!, "pass": pass!]
        let user = User(attributes: attributes)
        user.signUp { (message) -> Void in
            if let msg = message {
                self.showAlert(msg)
                return
            }
        }        
        self.signUpFormView.removeFromSuperview()
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "登録に失敗しました。", message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(action)
        self.presentViewController(alert, animated: true, completion: nil)
    }
}
