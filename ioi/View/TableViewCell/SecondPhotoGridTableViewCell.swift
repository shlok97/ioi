//
//  SecondPhotoGridTableViewCell.swift
//  ioi
//
//  Created by Shlok Kapoor on 29/06/18.
//  Copyright © 2018 Shlok. All rights reserved.
//

import UIKit
import Material

class SecondPhotoGridTableViewCell: TableViewCell {
    @IBOutlet var darkView: UIView!
    @IBOutlet var photoGridImageView: UIImageView!
    var _isShortlisted = false
    
    @objc func toggle() {
        if _isShortlisted {
            _isShortlisted = false
        }
        else {
            _isShortlisted = true
        }
        UIView.animate(withDuration: 0.15) {
            if self.isShortlisted {
                self.darkView.alpha = 0.7
                return
            }
            self.darkView.alpha = 0
        }
    }
    
    var isShortlisted: Bool {
        return _isShortlisted
    }
    
    override func awakeFromNib() {
        self.clipsToBounds = true
        darkView.alpha = 0
        darkView.backgroundColor = .clear
        let tap = UITapGestureRecognizer(target: self, action: #selector(toggle))
        tap.numberOfTapsRequired = 2
        self.addGestureRecognizer(tap)
    }

}
