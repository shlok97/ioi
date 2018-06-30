//
//  PendingConfirmationViewController.swift
//  ioi
//
//  Created by Shlok Kapoor on 30/06/18.
//  Copyright © 2018 Shlok. All rights reserved.
//

import UIKit
import LGButton
import EMAlertController

class PendingConfirmationViewController: UIViewController {

    @IBAction func cancelRequest(_ sender: LGButton) {
        let alert = EMAlertController(title: "Cancel Request", message: "Are you sure that you want to cancel the request?")
        
        let cancel = EMAlertAction(title: "CANCEL", style: .cancel) {
            self.navigationController?.popToRootViewController(animated: true)
        }
        let confirm = EMAlertAction(title: "BACK", style: .normal) {
            // Perform Action
        }
        
        alert.addAction(action: cancel)
        alert.addAction(action: confirm)
        alert.backgroundViewAlpha = 0.5
        self.present(alert, animated: true)
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
