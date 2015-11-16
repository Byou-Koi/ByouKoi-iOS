//
//  ProfileCell.swift
//  Byou-Koi
//
//  Created by 松下慶大 on 2015/11/15.
//  Copyright © 2015年 matsushita keita. All rights reserved.
//

import UIKit

class ProfileCell: UITableViewCell {
    @IBOutlet weak var yearsLabel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var profileLabel: ProfileLabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    var iconBorderView: UIView!
    var cameraImageView: UIImageView!
    var superViewFrame: CGRect!
    let menuBoxView1 = UILabel()
    let menuBoxView2 = UILabel()
    let menuBoxView3 = UILabel()
    let menuLabel1 = MenuLabel()
    let menuLabel2 = MenuLabel()
    let menuLabel3 = MenuLabel()

    override func awakeFromNib() {
        super.awakeFromNib()
        layoutIconImageView()
        createIconBorder()
        createCameraImageView()
        layoutNameLabel()
        
        createManuBoxView(menuBoxView1)
        createManuBoxView(menuBoxView2)
        createManuBoxView(menuBoxView3)
        
        createManuLabel(menuLabel1, text: "経験人数")
        createManuLabel(menuLabel2, text: "現在の恋人数")
        createManuLabel(menuLabel3, text: "ステータス")

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        superViewFrame = self.superview?.frame
        layoutIconBorder()
        layoutCameraImageView()
        setProfileLabel()
        setProfileLabels()
        layoutMenuBoxView(menuBoxView1, index: 0)
        layoutMenuBoxView(menuBoxView2, index: 1)
        layoutMenuBoxView(menuBoxView3, index: 2)
        
        layoutManuLabel(menuLabel1, index: 0)
        layoutManuLabel(menuLabel2, index: 1)
        layoutManuLabel(menuLabel3, index: 2)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK-Layout subviews-
    
    func layoutIconImageView() {
        iconImageView.makeCircle()
    }
    
    func layoutCameraImageView() {
        cameraImageView.center.x = iconImageView.center.x + 35
        cameraImageView.center.y = iconImageView.center.y + 35
        cameraImageView.makeCircle()
    }

    func layoutIconBorder() {
        iconBorderView.center = iconImageView.center
    }
    
    func layoutNameLabel() {
        nameLabel.font = UIFont.mainJaFont()
        nameLabel.font = UIFont.systemFontOfSize(21)
        nameLabel.textColor = UIColor.mainTextColor()
    }
    
    func layoutMenuBoxView(menuView: UILabel, index: CGFloat) {
        let margin: CGFloat = 20
        let width = (self.frame.width - margin*2 - 18) / 3
        menuView.frame.size = CGSize(width: width, height: width*3/4)
        menuView.center = CGPoint(x: (margin + width/2) + (width + 9)*index, y: 300)
        menuView.roudConers([.TopLeft, .TopRight], radius: 10)
    }
    
    func layoutManuLabel(menulabel: UILabel, index: CGFloat) {
        let margin: CGFloat = 20
        let width = (self.frame.width - margin*2 - 18) / 3
        menulabel.frame.size = CGSize(width: width, height: width*2/4)
        menulabel.font = UIFont(name: "HirakakuProN-W3", size: menulabel.frame.height/4)
        menulabel.center = CGPoint(x: (margin + width/2) + (width + 9)*index, y: 300 + ((width*3/4) / 2) + 5)
    }
    
    func setProfileLabel() {
        profileLabel.textColor = UIColor.mainTextColor()
        profileLabel.numberOfLines = 2
        profileLabel.makeCornerCircle()
        profileLabel.layer.borderWidth = 1
        profileLabel.layer.borderColor = UIColor(red: 255/255, green: 171/255, blue: 145/255, alpha: 1.0).CGColor
    }
    
    func setProfileLabels() {
        ageLabel.textColor = UIColor.subTextColor()
        ageLabel.font = UIFont.mainJaFont()
        ageLabel.font = UIFont.systemFontOfSize(17)
        yearsLabel.textColor = UIColor.subTextColor()
        yearsLabel.font = UIFont.mainJaFont()
        yearsLabel.font = UIFont.systemFontOfSize(16)
        areaLabel.textColor = UIColor.subTextColor()
        areaLabel.font = UIFont.mainJaFont()
        areaLabel.font = UIFont.systemFontOfSize(16)
    }
    
    //MARK-create subviews-
    
    func createIconBorder() {
        iconBorderView = UIView()
        iconBorderView.frame.size = CGSize(width: 135, height: 135)
        iconBorderView.layer.borderWidth = 1
        iconBorderView.layer.borderColor = UIColor.subTextColor().CGColor
        iconBorderView.makeCircle()
        addSubview(iconBorderView)
    }
    
    func createCameraImageView() {
        cameraImageView = UIImageView()
        cameraImageView.image = UIImage(named: "camera")
        cameraImageView.frame.size = CGSize(width: 30, height: 30)
//        addSubview(cameraImageView)
    }
    
    func createManuBoxView(menulabel: UILabel) {
        menulabel.textColor = UIColor.whiteColor()
        menulabel.font = UIFont(name: "Helvetica", size: 40)
        menulabel.textAlignment = .Center
        menulabel.backgroundColor = UIColor(red: 255/255, green: 171/255, blue: 145/255, alpha: 1.0)
        menulabel.layer.borderColor = UIColor(red: 255/255, green: 171/255, blue: 145/255, alpha: 1.0).CGColor
        menulabel.layer.borderWidth = 2
        addSubview(menulabel)
    }
    
    func createManuLabel(menulabel: UILabel, text: String) {
        menulabel.textColor = UIColor.mainTextColor()
        menulabel.makeCornerCircle()
        menulabel.textAlignment = .Center
        menulabel.text = text
        menulabel.layer.borderColor = UIColor(red: 255/255, green: 171/255, blue: 145/255, alpha: 1.0).CGColor
        menulabel.layer.borderWidth = 2
        addSubview(menulabel)
    }
    
}
