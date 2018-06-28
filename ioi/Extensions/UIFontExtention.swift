//
//  UIFontExtention.swift
//  ioi
//
//  Created by Shlok Kapoor on 28/06/18.
//  Copyright © 2018 Shlok. All rights reserved.
//

import UIKit

extension UIFont {
    
    enum FontWeight: String {
        case regular, medium, bold
    }
    
    static func robotoFont(ofSize: CGFloat, weight: FontWeight = .regular) -> UIFont {
        return UIFont(name: "Roboto-\(weight.rawValue.capitalized)", size: ofSize) ?? UIFont.systemFont(ofSize: ofSize)
    }
}
