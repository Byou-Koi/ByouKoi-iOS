//
//  User.swift
//  Byou-Koi
//
//  Created by 松下慶大 on 2015/11/29.
//  Copyright © 2015年 matsushita keita. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

enum Sex: Int {
    case Man = 0
    case Woman = 1
}

class User: NSObject {
    
    var id: Int?
    var name: String?
    var mail: String
    var pass: String?
    var sex: Bool?
    var imageURL: String?
    var authToken: String?
    
    init(attributes: JSON) {
        self.name = attributes["name"].string
        self.mail = attributes["email"].string!
        self.pass = attributes["pass"].string
        self.id = attributes["id"].int
        self.sex = attributes["sex"].bool
        if let url = attributes["avatar"]["url"].string {
            self.imageURL = "\(String.getRootApiUrl())\(url)"
        }
        self.authToken = attributes["auth_token"].string
    }
    
    func signUp(callback: (message: String?) -> Void) {
        
        let params: [String: AnyObject] = [
            "name": self.name!,
            "email": self.mail,
            "sex": self.sex!,
            "password": self.pass!,
            "password_confirmation": self.pass!
        ]
        
        Alamofire.request(.POST, String.getRootApiUrl() + "/api/users", parameters: params)
            .responseJSON { response in
                
                if let _ = response.result.error {
                    callback(message: "ネット環境がよろしくありません。")
                    return
                }

                let json = JSON(response.result.value!)
                if let messages = json["error_message"].array {
                    callback(message: messages.first?.string)
                    return
                }
                let currentUser = CurrentUser.sharedInstance
                currentUser.user = User(attributes: json["user"])
                currentUser.saveAuthTokenToUserDefaults()
                callback(message: nil)
        }
    }
    
    func login(callback: (message: String?) -> Void) {
        
        let params: [String: AnyObject] = [
            "email": self.mail,
            "password": self.pass!
        ]
        
        Alamofire.request(.POST, String.getRootApiUrl() + "/api/sessions", parameters: params)
            .responseJSON { response in
                
                if let _ = response.result.error {
                    callback(message: "ネット環境がよろしくありません。")
                    return
                }
                
                let json = JSON(response.result.value!)
                if let messages = json["error_message"].array {
                    callback(message: messages.first?.string)
                    return
                }
                
                let currentUser = CurrentUser.sharedInstance
                currentUser.user = User(attributes: json["user"])
                currentUser.saveAuthTokenToUserDefaults()
                callback(message: nil)

        }
    }
    
    func isCurrentUser() -> Bool {
        let currentUser = CurrentUser.sharedInstance.user
        return currentUser.id == self.id
    }
    
}


