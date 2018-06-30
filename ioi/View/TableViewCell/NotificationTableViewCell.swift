//
//  NotificationTableViewCell.swift
//  ioi
//
//  Created by Shlok Kapoor on 30/06/18.
//  Copyright © 2018 Shlok. All rights reserved.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {

    @IBOutlet var notificationLabel: UILabel!
    @IBOutlet var notificationImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setCell() {
        notificationImage.randomUserImage()
        notificationLabel.text = Lorem.name + " accepted your request"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
