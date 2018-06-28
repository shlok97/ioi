//
//  BookingFoldingTableViewCell.swift
//  ioi
//
//  Created by Shlok Kapoor on 28/06/18.
//  Copyright © 2018 Shlok. All rights reserved.
//

import UIKit
import FoldingCell

class RequestFoldingTableViewCell: FoldingCell {
    
    @IBOutlet var photographerImage: UIImageView!
    
    @IBOutlet var imageOne: UIImageView!
    @IBOutlet var imageTwo: UIImageView!
    @IBOutlet var imageThree: UIImageView!
    @IBOutlet var imageFour: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        foregroundView.layer.cornerRadius = 10
        foregroundView.clipsToBounds = true
        containerView.layer.cornerRadius = 10
        containerView.clipsToBounds = true
        
        imageOne.randomImage()
        imageTwo.randomImage()
        imageThree.randomImage()
        imageFour.randomImage()
        
        photographerImage.randomImage()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
