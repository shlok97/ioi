//
//  BookingFoldingTableViewCell.swift
//  ioi
//
//  Created by Shlok Kapoor on 28/06/18.
//  Copyright © 2018 Shlok. All rights reserved.
//

import UIKit
import FoldingCell

enum RequestStatus: String {
    case complete = "Complete"
    case pending = "Pending"
}

class RequestFoldingTableViewCell: FoldingCell {
    
    @IBOutlet var photographerImage: UIImageView!
    
    @IBOutlet var imageOne: UIImageView!
    @IBOutlet var imageTwo: UIImageView!
    @IBOutlet var imageThree: UIImageView!
    @IBOutlet var imageFour: UIImageView!
    
    var images: [UIImageView] = []
    var status: RequestStatus = .pending
    
    @IBOutlet var requestStatusView: UIView!
    @IBOutlet var requestStatus: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        foregroundView.layer.cornerRadius = 10
        foregroundView.clipsToBounds = true
        containerView.layer.cornerRadius = 10
        containerView.clipsToBounds = true
        
        images = [imageOne, imageTwo, imageThree, imageFour]
        
        for image in images {
            image.randomImage()
            image.clipsToBounds = true
        }
        
        photographerImage.randomImage()
        setRequestStatus(status: .pending)
        
    }
    
    func setRequestStatus(status: RequestStatus) {
        self.status = status
        self.requestStatus.text = status.rawValue
        if status == .pending {
            self.requestStatusView.backgroundColor = UIColor(hexString: "#FF9300")
        }
        else {
            self.requestStatusView.backgroundColor = UIColor(hexString: "#2782C0")
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
