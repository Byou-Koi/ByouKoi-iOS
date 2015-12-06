//
//  CurrentUser.swift
//  Byou-Koi
//
//  Created by 松下慶大 on 2015/11/29.
//  Copyright © 2015年 matsushita keita. All rights reserved.
//

import UIKit
import SwiftyJSON

class CurrentUser: NSObject {
    static let sharedInstance = CurrentUser()
    var user: User!
    
    func saveAuthTokenToUserDefaults() {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(self.user.authToken, forKey: "AuthToken")
        defaults.synchronize()
    }
    
    func isLogin() -> Bool {
        let defaults = NSUserDefaults.standardUserDefaults()
        let authToken = defaults.objectForKey("AuthToken") as? String
        let bool = (authToken != nil) ? true : false
        return bool
    }
    
    func logout() {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.removeObjectForKey("AuthToken")
        defaults.synchronize()
    }
}
