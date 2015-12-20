//
//  FriendsTableViewController.swift
//  Byou-Koi
//
//  Created by 松下慶大 on 2015/11/19.
//  Copyright © 2015年 matsushita keita. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {

    let images = ["honda", "paruru", "horikita"]
    let currentUser = CurrentUser.sharedInstance
    var isNewLaver = true
    var currentLover: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerCellWithIdentifier("FriendCell")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.hidden = false
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if let lover = currentUser.findUnCheckedLover() {
            self.currentLover = lover
            performSegueWithIdentifier("modelCongratulationsVC", sender: nil)
        }

        
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
        return 3
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FriendCell", forIndexPath: indexPath) as! FriendCell
        cell.iconImageView.image = UIImage(named: self.images[indexPath.row])
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 91
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("show", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "modelCongratulationsVC" {
            let congratulationsViewController = segue.destinationViewController as! CongratulationsViewController
            congratulationsViewController.lover = self.currentLover
        }
    }
}
