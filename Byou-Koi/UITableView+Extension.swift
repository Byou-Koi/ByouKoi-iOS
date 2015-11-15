//
//  UITableView+Extension.swift
//  Byou-Koi
//
//  Created by 松下慶大 on 2015/11/15.
//  Copyright © 2015年 matsushita keita. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    func registerCellWithIdentifier(cellName: String) {
        self.registerNib(UINib(nibName: cellName, bundle: nil), forCellReuseIdentifier: cellName)
    }
}
