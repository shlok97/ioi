//
//  PriceCheckView.swift
//  ioi
//
//  Created by Shlok Kapoor on 09/07/18.
//  Copyright © 2018 Shlok. All rights reserved.
//

import UIKit

class PriceCheckPhotoView: CardView {
    
    @IBOutlet var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = UIColor.black
        imageView.randomImage()
    }
}
