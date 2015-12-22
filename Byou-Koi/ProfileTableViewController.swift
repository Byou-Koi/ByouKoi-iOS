//
//  ProfileTableViewController.swift
//  Byou-Koi
//
//  Created by 松下慶大 on 2015/11/15.
//  Copyright © 2015年 matsushita keita. All rights reserved.
//

import UIKit

class ProfileTableViewController: UITableViewController {

    let editMenus = ["名前", "自己紹介文", "年齢", "場所"]
    let currentUser = CurrentUser.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "マイページ"
        tableView.registerCellWithIdentifier("ProfileCell")
        tableView.registerCellWithIdentifier("ProfileLabelCell")
        tableView.registerCellWithIdentifier("EditMenuCell")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu.png"), style: .Plain, target: self, action: "showMenu")
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 2 {
            return 3
        } else {
            return 1
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("ProfileCell", forIndexPath: indexPath) as! ProfileCell
            cell.nameLabel.text = self.currentUser.user!.name
            cell.mailLabel.text = self.currentUser.user!.mail
            cell.iconImageView.asyncLoadImage(self.currentUser.user!.imageURL, placeHolder: "no_image.png")
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCellWithIdentifier("ProfileLabelCell", forIndexPath: indexPath) as! ProfileLabelCell
            cell.editProfileButton.addTarget(self, action: "modalEditProdileViewController", forControlEvents: .TouchUpInside)
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("EditMenuCell", forIndexPath: indexPath) as! EditMenuCell
            cell.menuLabel.text = editMenus[indexPath.row]
            return cell
        }
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var height: CGFloat = 0
        if indexPath.section == 0 {
            height = 400
        } else if indexPath.section == 1 {
            height = 50
        } else {
            height = 40
        }
        return height
    }
    
    
    func showMenu() {
        let actionSheet = UIAlertController(title: "メニュー", message: nil, preferredStyle: .ActionSheet)
        actionSheet.addAction(
            UIAlertAction(title: "ログアウト", style: .Default) { (action) in
                self.currentUser.logout()
                let tabBarController = self.storyboard?.instantiateViewControllerWithIdentifier("MainTabBarController") as! UITabBarController
                UIApplication.sharedApplication().keyWindow?.rootViewController = tabBarController
            }
        )
        actionSheet.addAction(
            UIAlertAction(title: "キャンセル", style: .Cancel, handler: nil)
        )
        self.presentViewController(actionSheet, animated: true, completion: nil)
    }
    
    func modalEditProdileViewController() {
        performSegueWithIdentifier("modalEditProdileViewController", sender: nil)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
