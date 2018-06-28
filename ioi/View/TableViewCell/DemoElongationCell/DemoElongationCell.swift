//
//  DemoElongationCell.swift
//  ioi
//
//  Created by Shlok Kapoor on 28/06/18.
//  Copyright © 2018 Shlok. All rights reserved.
//

import ElongationPreview
import UIKit

final class DemoElongationCell: ElongationCell {
    
    @IBOutlet var topImageView: UIImageView!
    @IBOutlet var localityLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    
    @IBOutlet var aboutTitleLabel: UILabel!
    @IBOutlet var aboutDescriptionLabel: UILabel!
    
    @IBOutlet var topImageViewTopConstraint: NSLayoutConstraint!
}
