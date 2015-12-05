//
//  SimpleChatViewController.swift
//  Byou-Koi
//
//  Created by 松下慶大 on 2015/11/25.
//  Copyright © 2015年 matsushita keita. All rights reserved.
//

import UIKit

class SimpleChatViewController: LGChatController, LGChatControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        self.opponentImage = UIImage(named: "paruru")
        self.title = "Simple Chat"
        let helloWorld = LGChatMessage(content: "おはよう！", sentBy: LGChatMessage.SentBy.Opponent)
        self.messages = [helloWorld]
        
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.hidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func chatController(chatController: LGChatController, didAddNewMessage message: LGChatMessage) {
        print("Did Add Message: \(message.content)")
    }


}
