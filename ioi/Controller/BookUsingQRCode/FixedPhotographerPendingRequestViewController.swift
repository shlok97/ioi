//
//  FixedPhotographerRequestCompleteViewController.swift
//  ioi
//
//  Created by Shlok Kapoor on 04/07/18.
//  Copyright © 2018 Shlok. All rights reserved.
//

import UIKit

class FixedPhotographerPendingRequestViewController: PendingConfirmationViewController {
    @IBOutlet var photographerPicture: UIImageView!
    
    @IBOutlet var photographerNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        photographerPicture.randomImage()
        photographerNameLabel.text = Lorem.name
    }
}
