//
//  ChatViewController.swift
//  Byou-Koi
//
//  Created by 松下慶大 on 2015/11/19.
//  Copyright © 2015年 matsushita keita. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var dockViewHeightConstrain: NSLayoutConstraint!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var dockView: UIView!
    @IBOutlet weak var messageTableView: UITableView!

    var array: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.messageTableView.delegate = self
        self.messageTableView.dataSource = self
        self.messageTableView.estimatedRowHeight = 90
        self.messageTableView.rowHeight = UITableViewAutomaticDimension
        self.messageTableView.registerCellWithIdentifier("MyMessageCell")
        self.messageTableView.registerCellWithIdentifier("PartnerMessageCell")
    
        let tapGesture = UITapGestureRecognizer(target: self, action: "didTappedView")
        self.messageTableView.addGestureRecognizer(tapGesture)
        
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserver(self, selector: "showKeyboard:", name: UIKeyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: "hideKeyboard:", name: UIKeyboardWillHideNotification, object: nil)

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
        self.tabBarController?.tabBar.hidden = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.messageTableView.contentOffset.y = messageTableView.contentSize.height - self.view.frame.height + 60
    }
    
    override func layoutSublayersOfLayer(layer: CALayer) {
        super.layoutSublayersOfLayer(layer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func showKeyboard(notification: NSNotification) {
        let keyboardRect = notification.userInfo?[UIKeyboardFrameEndUserInfoKey]?.CGRectValue
        UIView.animateWithDuration(0.25, animations: {
            self.messageTableView.contentOffset.y += (keyboardRect?.size.height)! + 600
            self.view.layoutIfNeeded()
            self.dockViewHeightConstrain.constant = (keyboardRect?.size.height)! + 60
            self.view.layoutIfNeeded()
            
            
            }, completion: nil)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
    }
    
    func hideKeyboard(notification: NSNotification) {
        UIView.animateWithDuration(0.25, animations: {
            self.dockViewHeightConstrain.constant = 60
            self.view.layoutIfNeeded()
            }, completion: nil)
    }
    
    @IBAction func tapSendButton(sender: UIButton) {
        self.array.append(self.messageTextField.text!)
        self.messageTextField.text = ""
        self.messageTableView.reloadData()
    }

    func didTappedView() {
        self.messageTextField.endEditing(true)
    }
    
    
    //TableView
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("MyMessageCell", forIndexPath: indexPath) as! MyMessageCell
            cell.messageLabel.text = array[indexPath.row]
            cell.layoutMessageLabel(self.view.frame.size)
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("PartnerMessageCell", forIndexPath: indexPath) as! PartnerMessageCell
            cell.messageLabel.text = array[indexPath.row]
            cell.layoutMessageLabel(self.view.frame.size)
            return cell
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    
    
    

}
