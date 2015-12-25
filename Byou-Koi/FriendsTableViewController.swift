//
//  FriendsTableViewController.swift
//  Byou-Koi
//
//  Created by 松下慶大 on 2015/11/19.
//  Copyright © 2015年 matsushita keita. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController, CurrentUserDelegate {

    let images = ["honda", "paruru", "horikita"]
    let currentUser = CurrentUser.sharedInstance
    var isNewLaver = true
    var currentLover: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentUser.delegate = self
        tableView.registerCellWithIdentifier("FriendCell")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
        self.tabBarController?.tabBar.hidden = false
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let user = self.currentUser.user {
            return user.lovers.count
        } else {
            return 0
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FriendCell", forIndexPath: indexPath) as! FriendCell
        let lover = self.currentUser.user?.lovers[indexPath.row]
        cell.nameLabel.text = lover?.name
        cell.messageLabel.text = lover?.last_message
        cell.timeLabel.text = NSDate.convertToNSDate(lover!.last_message_time!).timeAgoInWords()
        cell.iconImageView.asyncLoadImage(lover?.imageURL, placeHolder: "no_image")
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 91
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.currentLover = self.currentUser.user?.lovers[indexPath.row]
        performSegueWithIdentifier("showChatVC", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "modelCongratulationsVC" {
            let congratulationsViewController = segue.destinationViewController as! CongratulationsViewController
            congratulationsViewController.lover = self.currentLover
        } else if segue.identifier == "showChatVC" {
            let chatViewController = segue.destinationViewController as! ChatViewController
            chatViewController.lover = self.currentLover
        }
    }
    
    //delegate
    
    func didFinisedFetchUser(currentUser: CurrentUser) {
        self.tableView.reloadData()
        if currentUser.isLogin() {
            if let lover = currentUser.findUnCheckedLover() {
                self.currentLover = lover
                performSegueWithIdentifier("modelCongratulationsVC", sender: nil)
            }
        }
    }
    
    
}
