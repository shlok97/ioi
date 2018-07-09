//
//  OnboardingView.swift
//  ioi
//
//  Created by Shlok Kapoor on 07/07/18.
//  Copyright © 2018 Shlok. All rights reserved.
//

import UIKit
import LGButton

protocol PhotoshootTypePopupViewDelegate: class {
    func changedPhotoshootCategory(_ index: Int)
    func continueButtonTapped()
}

class PhotoshootTypePopupView: CardView {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var photoshootTypeSegmentio: PhotoshootTypeSegmentioPopup!
    @IBOutlet var bottomButton: LGButton!
    
    weak var delegate: PhotoshootTypePopupViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        photoshootTypeSegmentio.valueDidChange = {
            segmentio, index in
            self.delegate?.changedPhotoshootCategory(index)
        }
    }
    
    @IBAction func continueButtonTapped(_ sender: Any) {
        delegate?.continueButtonTapped()
    }
}

