//
//  RoundedButton.swift
//  ioi
//
//  Created by Shlok Kapoor on 10/06/18.
//  Copyright © 2018 Shlok. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {
    override func awakeFromNib() {
        self.layer.cornerRadius = 10.0
    }
}
