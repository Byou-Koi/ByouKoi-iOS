//
//  Chat.swift
//  Byou-Koi
//
//  Created by 松下慶大 on 2015/12/17.
//  Copyright © 2015年 matsushita keita. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class Chat: NSObject {
    
    var message: String
    var user: User
    
    init(attributes: [String: AnyObject]) {
        self.message = attributes["message"] as! String
        self.user = attributes["user"] as! User
    }
    
    func sendMessage() {
        let params: [String: AnyObject] = [
            "message": self.message,
            "user_id": self.user.id!
        ]
        Alamofire.request(.POST, String.getRootApiUrl() + "/api/chats", parameters: params)
            .responseString { response in
                print("Success: \(response.result.isSuccess)")
                print("Response String: \(response.result.error)")
        }
    }
}
