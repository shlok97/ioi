//
//  UIViewExtension.swift
//  ioi
//
//  Created by Shlok Kapoor on 30/06/18.
//  Copyright © 2018 Shlok. All rights reserved.
//

import UIKit

extension UIView {
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if parentResponder is UIViewController {
                return parentResponder as! UIViewController?
            }
        }
        return nil
    }
}
