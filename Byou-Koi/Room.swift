//
//  Room.swift
//  Byou-Koi
//
//  Created by 松下慶大 on 2015/12/23.
//  Copyright © 2015年 matsushita keita. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class Room: NSObject {
    
    var auth_token: String?
    var user: User
    var lover: User
    var id: Int?
    
    init(attributes: JSON) {
        self.auth_token = attributes["auth_token"].string
        self.user = User(attributes: attributes["user"])
        self.lover = User(attributes: attributes["lover"])
    }
    
}
