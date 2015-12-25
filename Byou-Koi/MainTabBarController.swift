//
//  MainTabBarController.swift
//  Byou-Koi
//
//  Created by 松下慶大 on 2015/11/28.
//  Copyright © 2015年 matsushita keita. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //使用する色を用意
        let blue  = UIColor(red: 11.0 / 255, green: 78.0 / 255, blue: 160.0 / 255, alpha: 1.0)
        let black = UIColor(red: 48.0 / 255, green: 48.0 / 255, blue: 47.0 / 255, alpha: 1.0)
        let white = UIColor.whiteColor()
        
        //使用する画像を用意
        let cameraImage            = makeOriginalImage("couple5")
        let highlightedCameraImage = makeOriginalImage("couple5_hi")
        let carImage               = makeOriginalImage("man117")
        let highlightedCarImage    = makeOriginalImage("man117_hi")
        
        //Tab Barの背景色を設定
//        UITabBar.appearance().barTintColor = 
        
        //Tab Barの曇りガラス効果をオフに設定
//        UITabBar.appearance().translucent = false
        
        //Tab Bar Controllerに紐付けられているView Controllerの取得
        let firstViewController  = self.viewControllers![0]
        let secondViewController = self.viewControllers![1]
        
        //それぞれのView ControllerのTab Bar Itemにオリジナル画像を設定
        firstViewController.tabBarItem  = UITabBarItem(title: "恋人", image: cameraImage, selectedImage: highlightedCameraImage)
        secondViewController.tabBarItem = UITabBarItem(title: "マイページ", image: carImage, selectedImage: highlightedCarImage)
        
        //特定のキーを指定した辞書型を用意
        let normalAttributes: Dictionary! = [NSForegroundColorAttributeName: black]
        let selectedAttributes: Dictionary! = [NSForegroundColorAttributeName: UIColor.mainColor()]
        
        //Tab Bar Itemのタイトルカラーを設定
        UITabBarItem.appearance().setTitleTextAttributes(normalAttributes, forState: UIControlState.Normal)
        UITabBarItem.appearance().setTitleTextAttributes(selectedAttributes, forState: UIControlState.Selected)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let currentUser = CurrentUser.sharedInstance
        if currentUser.isLogin() { return }
        performSegueWithIdentifier("ModalLoginVC", sender: nil)
    
    }
    
    func makeOriginalImage(name: String) -> UIImage {
        let image = UIImage(named: name)!
        let originalImage = image.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        return originalImage
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
