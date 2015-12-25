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

class ChatViewController: LGChatController, LGChatControllerDelegate, PTPusherDelegate {

    var client: PTPusher!
    let currentUser = CurrentUser.sharedInstance
    var lover: User!
    var chats: [Chat] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.client = PTPusher(key: Secret.pusherAccessKey(), delegate: self, encrypted: true)
        self.client.connect()
        self.delegate = self
        self.title = self.lover.name
        receiveMessage()
        
        Chat.fetchMessages(self.currentUser.user!, lover: self.lover) { (chat) in
            self.chats.append(chat)
            let message: LGChatMessage!
            
            if chat.user.isCurrentUser() {
                message = LGChatMessage(content: chat.message, sentBy: LGChatMessage.SentBy.User)
            } else {
                message = LGChatMessage(content: chat.message, sentBy: LGChatMessage.SentBy.Opponent)
            }
            self.messages.append(message)
            self.tableView.reloadData()
        }
        
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.hidden = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu.png"), style: .Plain, target: self, action: "showMenu")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //メッセージを送信後に呼ばれる
    func chatController(chatController: LGChatController, didAddNewMessage message: LGChatMessage) {
        let attributes: [String: AnyObject] = [
            "message": message.content,
            "user": self.currentUser.user!
        ]
        let chat = Chat(attributes: attributes)
        chat.sendMessage(self.lover)
    }
    
    func receiveMessage() {
        let channel = self.client.subscribeToChannelNamed(self.lover.room_token) //チャンネル名
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

    func showMenu() {
        let sentimentView = SentimentView.instance()
        sentimentView.frame = self.view.frame
        sentimentView.frame.origin = CGPointZero
        self.view.addSubview(sentimentView)
    }

}
