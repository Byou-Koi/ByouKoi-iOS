//
//  CurrentUser.swift
//  Byou-Koi
//
//  Created by 松下慶大 on 2015/11/29.
//  Copyright © 2015年 matsushita keita. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class CurrentUser: NSObject {
    static let sharedInstance = CurrentUser()
    var user: User!
    
    func saveAuthTokenToUserDefaults() {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(self.user.authToken, forKey: "AuthToken")
        defaults.setObject(self.user.id, forKey: "Id")
        defaults.synchronize()
    }
    
    func fetchCurrentUser() {
        let dafaults = NSUserDefaults.standardUserDefaults()
        let currentUserId = dafaults.objectForKey("Id") as! Int
        Alamofire.request(.GET, String.getRootApiUrl() + "/api/users/\(currentUserId)", parameters: nil)
            .responseJSON { response in
                let json = JSON(response.result.value!)
                self.user = User(attributes: json["user"])
        }
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
        defaults.removeObjectForKey("Id")
        defaults.synchronize()
    }
}
