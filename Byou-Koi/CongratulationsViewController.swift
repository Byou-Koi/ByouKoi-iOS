//
//  CongratulationsViewController.swift
//  Byou-Koi
//
//  Created by 松下慶大 on 2015/12/19.
//  Copyright © 2015年 matsushita keita. All rights reserved.
//

import UIKit

class CongratulationsViewController: UIViewController {

    var lover: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let congratulationsView = CongratulationsView.instance()
        congratulationsView.frame = self.view.frame
        self.view.addSubview(congratulationsView)
        
        congratulationsView.nameLabel.text = "本田つばさ"
        congratulationsView.backButton.addTarget(self, action: "back", forControlEvents: .TouchUpInside)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func back() {
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
}
