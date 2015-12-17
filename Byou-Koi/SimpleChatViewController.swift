//
//  SimpleChatViewController.swift
//  Byou-Koi
//
//  Created by 松下慶大 on 2015/11/25.
//  Copyright © 2015年 matsushita keita. All rights reserved.
//

import UIKit
import Pusher
import SwiftyJSON

class SimpleChatViewController: LGChatController, LGChatControllerDelegate, PTPusherDelegate {

    var client: PTPusher!
    let currentUser = CurrentUser.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.client = PTPusher(key: Secret.pusherAccessKey(), delegate: self, encrypted: true)
        self.client.connect()
        self.delegate = self
        
        receiveMessage()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.hidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //メッセージを送信後に呼ばれる
    func chatController(chatController: LGChatController, didAddNewMessage message: LGChatMessage) {
        print("Did Add Message: \(message.content)")
        let attributes: [String: AnyObject] = [
            "message": message.content,
            "user": self.currentUser.user
        ]
        let chat = Chat(attributes: attributes)
        chat.sendMessage()
    }
    
    func receiveMessage() {
        let channel = self.client.subscribeToChannelNamed("general")
        channel.bindToEventNamed("chat_event") { (channelEvent) -> Void in
            //pusherから通知がくると呼ばれる
            let json = JSON(channelEvent.data)
            let user = User(attributes: json["user"])
            
            if user.isCurrentUser() {
                return
            }
            
            let message = LGChatMessage(content: json["message"].string!, sentBy: LGChatMessage.SentBy.Opponent)
            self.messages.append(message)
            self.tableView.reloadData()
        }
    }


}
