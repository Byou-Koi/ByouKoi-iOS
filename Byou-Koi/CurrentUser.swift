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

@objc protocol CurrentUserDelegate {
    func didFinisedFetchUser(currentUser: CurrentUser)
}

class CurrentUser: NSObject {
    static let sharedInstance = CurrentUser()
    var user: User!
    weak var delegate: CurrentUserDelegate?
    
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
                
                for lover in json["lovers"].array! {
                    let loverUser = User(attributes: lover["lover"])
                    loverUser.checked = lover["checked"].bool!
                     self.user.lovers.append(loverUser)
                }
                
                self.delegate?.didFinisedFetchUser(self)
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
    
    func uploadProfileImage(image: UIImage, callback: () -> Void) {
        
        let params: [String: AnyObject] = [
            "name": user.name!,
            "auth_token": user.authToken!
        ]
        let pass = String.getRootApiUrl() +  "/api/users/\(self.user.id!)"
        let httpMethod = Alamofire.Method.PUT.rawValue
        
        let urlRequest = NSData.urlRequestWithComponents(httpMethod, urlString: pass, parameters: params, image: image)
        Alamofire.upload(urlRequest.0, data: urlRequest.1)
            .responseJSON { response in
                
                if let error = response.result.error {
                    print(error)
                    return
                }
                
                let json = JSON(response.result.value!)
                self.user = User(attributes: json["user"])
                callback()
        }
        
    }
    
    func checkLover(lover: User) {
        let params: [String: AnyObject] = [
            "lover_id": lover.id!
        ]
        let pass = String.getRootApiUrl() +  "/api/users/\(self.user.id!)/check_lover"
        Alamofire.request(.POST, pass, parameters: params)
            .responseJSON { response in
                
        }
    }
    
    func findUnCheckedLover() -> User? {
        for lover in self.user.lovers {
            if lover.checked == false {
                lover.checked = true
                return lover
            }
        }
        return nil
    }
    
    
    
    
}
