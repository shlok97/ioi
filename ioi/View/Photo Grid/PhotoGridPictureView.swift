//
//  PhotoGridPictureView.swift
//  ioi
//
//  Created by Shlok Kapoor on 11/06/18.
//  Copyright © 2018 Shlok. All rights reserved.
//

import UIKit

class PhotoGridPictureView: UIView {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var darkView: UIView!
    private var _isSelected = false
    
    @objc func toggle() {
        if _isSelected {
            _isSelected = false
        }
        else {
            _isSelected = true
        }
        UIView.animate(withDuration: 0.3) {
            if self.isSelected {
                self.darkView.alpha = 0.6
                return
            }
            self.darkView.alpha = 0
        }
    }
    
    var isSelected: Bool {
        return _isSelected
    }
    
    override func awakeFromNib() {
        self.clipsToBounds = true
//        darkView.isHidden = true
        darkView.alpha = 0
        let tap = UITapGestureRecognizer(target: self, action: #selector(toggle))
        tap.numberOfTapsRequired = 1
        self.addGestureRecognizer(tap)
    }
    
}
