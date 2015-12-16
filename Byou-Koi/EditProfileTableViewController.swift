//
//  EditProfileTableViewController.swift
//  Byou-Koi
//
//  Created by 松下慶大 on 2015/12/10.
//  Copyright © 2015年 matsushita keita. All rights reserved.
//

import UIKit

class EditProfileTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var iconImageView: UIImageView!
    let currentUser = CurrentUser.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.registerCellWithIdentifier("EditIconCell")
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "キャンセル", style: .Plain, target: self, action: "cancelEdit")
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "保存", style: .Plain, target: self, action: "saveProfile")
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
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("EditIconCell", forIndexPath: indexPath) as! EditIconCell
        cell.editIconButton.addTarget(self, action: "selectIconImage", forControlEvents: .TouchUpInside)
        self.iconImageView = cell.iconImageView
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 85
    }
    
    
    func cancelEdit() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func selectIconImage() {
        pickImageFromLibrary()
    }
    
    func saveProfile() {
        currentUser.uploadProfileImage(self.iconImageView.image!) { () in
            self.dismissViewControllerAnimated(false, completion: nil)
        }
    }
    
    //カメラロール起動
    func pickImageFromLibrary() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
            let controller = UIImagePickerController()
            controller.delegate = self
            controller.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            self.presentViewController(controller, animated: true, completion: nil)
        }
    }
    
    // 写真を選択した時に呼ばれる
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if info[UIImagePickerControllerOriginalImage] != nil {
            let image = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.iconImageView.image = image
        }
        picker.dismissViewControllerAnimated(true, completion: nil)
    }

}
