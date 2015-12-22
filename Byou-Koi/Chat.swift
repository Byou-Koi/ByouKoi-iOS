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
    
    func sendMessage(lover: User) {
        let params: [String: AnyObject] = [
            "message": self.message,
            "user_id": self.user.id!,
            "target_user_id": lover.id!,
            "room_token": lover.room_token!
        ]
        Alamofire.request(.POST, String.getRootApiUrl() + "/api/chats", parameters: params)
            .responseJSON { response in
                print("Success: \(response.result.isSuccess)")
                print("Response String: \(response.result.error)")
        }
    }
    
    class func fetchMessages(user: User, lover: User, callback: (chat: Chat) -> Void) {
        let params: [String: AnyObject] = [
            "room_token": lover.room_token!
        ]
        
        Alamofire.request(.GET, String.getRootApiUrl() + "/api/chats", parameters: params)
            .responseJSON { response in
                if let _ = response.result.error {
                    return
                }
                let json = JSON(response.result.value!)
                for chat in json["chats"].array! {
                    let user = User(attributes: chat["user"])
                    print(user.name)
                    let chat = Chat(attributes: ["message": chat["message"].string!, "user": user])
                    callback(chat: chat)
                }
        }
    }
}
