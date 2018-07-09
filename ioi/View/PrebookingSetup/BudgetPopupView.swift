//
//  BudgetPopupView.swift
//  ioi
//
//  Created by Shlok Kapoor on 07/07/18.
//  Copyright © 2018 Shlok. All rights reserved.
//

import UIKit
import LGButton
import SwiftRangeSlider

protocol BudgetPopupViewDelegate: class {
    func chooseBudget(_ min: Int, _ max: Int)
    func doneButtonTapped()
}

class BudgetPopupView: CardView {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var budgetSlider: RangeSlider!
    @IBOutlet var bottomButton: LGButton!
    
    var delegate: BudgetPopupViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        delegate?.doneButtonTapped()
    }
}
