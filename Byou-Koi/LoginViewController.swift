//
//  LoginViewController.swift
//  Byou-Koi
//
//  Created by 松下慶大 on 2015/11/28.
//  Copyright © 2015年 matsushita keita. All rights reserved.
//

import UIKit

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
        self.loginFormView.removeFromSuperview()
//        dismissViewControllerAnimated(true, completion: nil)

    }
    
    func startSignUp(sender: UIButton) {
        self.signUpFormView.removeFromSuperview()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
