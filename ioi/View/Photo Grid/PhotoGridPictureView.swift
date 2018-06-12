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
    
    func toggle() {
        if _isSelected {
            _isSelected = false
        }
        else {
            _isSelected = true
        }
        darkView.isHidden = !isSelected
    }
    
    var isSelected: Bool {
        return _isSelected
    }
    
    override func awakeFromNib() {
        self.clipsToBounds = true
        darkView.isHidden = true
    }
    
}
