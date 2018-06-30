//
//  UITableViewExtension.swift
//  ioi
//
//  Created by Shlok Kapoor on 30/06/18.
//  Copyright © 2018 Shlok. All rights reserved.
//

import UIKit

extension UITableView {
    func customTable(withRadius radius: CGFloat) {
        self.roundCorners(withRadius: radius)
        self.separatorStyle = UITableViewCellSeparatorStyle.none
    }
}
