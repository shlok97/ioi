//
//  RequestCompleteViewController.swift
//  ioi
//
//  Created by Shlok Kapoor on 17/06/18.
//  Copyright © 2018 Shlok. All rights reserved.
//

import UIKit

class RequestCompleteViewController: UIViewController {

    @IBOutlet var requestIDLabel: UILabel!
    @IBOutlet var requestedOn: UILabel!
    @IBOutlet var eventTitleLabel: UILabel!
    @IBOutlet var eventDateLabel: UILabel!
    @IBOutlet var eventLocationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func doneTapped(_ sender: Any) {
        
    }
}
