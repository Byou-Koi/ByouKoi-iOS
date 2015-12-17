//
//  UIImage+Extension.swift
//  Byou-Koi
//
//  Created by 松下慶大 on 2015/12/17.
//  Copyright © 2015年 matsushita keita. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func asyncLoadImage(imageString: String?, placeHolder: String) {
        self.image = UIImage(named: placeHolder)
        if let imgString = imageString {
            let url = NSURL(string: imgString)
            let req = NSURLRequest(URL:url!)
            let session = NSURLSession.sharedSession()
            let task = session.dataTaskWithRequest(req, completionHandler: { (data, response, error) -> Void in
                guard let _ = data else {
                    return
                }
                dispatch_async(dispatch_get_main_queue(), {
                    self.image = UIImage(data: NSData(data: data!))
                })
            })
            task.resume()
        }
    }
    
}
