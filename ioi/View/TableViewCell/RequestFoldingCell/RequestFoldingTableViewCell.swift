//
//  BookingFoldingTableViewCell.swift
//  ioi
//
//  Created by Shlok Kapoor on 28/06/18.
//  Copyright © 2018 Shlok. All rights reserved.
//

import UIKit
import FoldingCell
import EMAlertController

enum RequestStatus: String {
    case confirmed = "Confirmed"
    case pending = "Pending"
    case canceled = "Canceled"
    
    func requestViewColor() -> UIColor {
        switch self {
        case .confirmed:
            return UIColor(hexString: "#2782C0")
        case .pending:
            return UIColor(hexString: "#FF9300")
        case .canceled:
            return UIColor(hexString: "#FF4A35")
        }
    }
}

class RequestFoldingTableViewCell: FoldingCell {
    
    @IBOutlet var photographerImage: UIImageView!
    
    @IBOutlet var imageOne: UIImageView!
    @IBOutlet var imageTwo: UIImageView!
    @IBOutlet var imageThree: UIImageView!
    @IBOutlet var imageFour: UIImageView!
    
    var images: [UIImageView] = []
    var status: RequestStatus = .pending
    
    @IBOutlet var cancelRequestButton: UIButton!
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
    @IBAction func cancelRequestTapped(_ sender: UIButton) {
        let alert = EMAlertController(title: "Cancel Request", message: "Are you sure that you want to cancel the request?")
        
        let cancel = EMAlertAction(title: "CANCEL", style: .cancel)
        let confirm = EMAlertAction(title: "BACK", style: .normal) {
            // Perform Action
        }
        
        alert.addAction(action: cancel)
        alert.addAction(action: confirm)
        alert.backgroundViewAlpha = 0.5
        self.parentViewController?.present(alert, animated: true)
    }
    
    func setRequestStatus(status: RequestStatus) {
        self.status = status
        self.requestStatus.text = status.rawValue
        self.requestStatusView.backgroundColor = self.status.requestViewColor()
        cancelRequestButton.isHidden = status == .canceled
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
