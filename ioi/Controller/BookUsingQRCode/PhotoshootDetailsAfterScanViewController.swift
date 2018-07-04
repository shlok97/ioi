//
//  PhotoshootDetailsAfterScanViewController.swift
//  ioi
//
//  Created by Shlok Kapoor on 04/07/18.
//  Copyright © 2018 Shlok. All rights reserved.
//

import UIKit
import EMAlertController

class PhotoshootDetailsAfterScanViewController: PhotoshootDetailsFormViewController {

    @IBOutlet var photographerImage: UIImageView!
    
    @IBOutlet var photographerNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        photographerImage.randomImage()
        photographerNameLabel.text = Lorem.name
    }
    
    override func confirmDetails(_ sender: Any) {
        showConfirmDetailsAlert(photographerName: photographerNameLabel.text)
    }

}
