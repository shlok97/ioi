//
//  InterestsView.swift
//  ioi
//
//  Created by Shlok Kapoor on 10/06/18.
//  Copyright © 2018 Shlok. All rights reserved.
//

import UIKit

class InterestView: UIView {
    private var darkView = UIView()
    private var _interest: Interest?
    override func awakeFromNib() {
        self.layer.cornerRadius = 5.0
        self.backgroundColor = UIColor.black
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(toggleDarkOverlay))
        self.addGestureRecognizer(tap)
    }
    func setup(interest: Interest) {
        awakeFromNib()
        addImage(withUrl: interest.interestImageURL!)
        self._interest = interest
        addDarkOverlay()
        addText(text: interest.interestTitle)
    }
    
    private func addImage(withUrl imageURL: String!) {
        let imageView = UIImageView()
        imageView.downloadedFrom(link: imageURL)
        print(imageURL)
        addImage(view: imageView)
    }
    
    private func addImage(view imageView: UIImageView!) {
        imageView.frame = CGRect(x: 0, y: 0, width: self.frame.width , height: self.frame.height)
        imageView.layer.masksToBounds = true
        let rectShape = CAShapeLayer()
        rectShape.bounds = self.frame
        rectShape.position = self.center
        rectShape.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.allCorners], cornerRadii: CGSize(width: 10, height: 10)).cgPath
        self.layer.mask = rectShape
        imageView.contentMode = .scaleAspectFill
        self.addSubview(imageView)
    }
    
    private func addText(text: String) {
        let descriptionLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        descriptionLabel.center = CGPoint(x: self.frame.width/2, y: self.frame.height/2)
        descriptionLabel.text = text.capitalized
        descriptionLabel.textAlignment = .center
        descriptionLabel.font = UIFont(name: "AvenirNext-Bold", size: 25.0)
        descriptionLabel.textColor = UIColor.white
        self.addSubview(descriptionLabel)
    }
    
    private func addDarkOverlay() {
        let frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        darkView = UIView(frame: frame)
        darkView.layer.backgroundColor = UIColor(hexString: "#0000", alpha: 0.6).cgColor
        self.addSubview(darkView)
        darkView.alpha = 0.1
    }
    
    @objc func toggleDarkOverlay() -> Void {
        if let interest = self._interest {
            interest.tappedOn()
            if interest.isSelected {
                darkView.alpha = 1
            } else {
                darkView.alpha = 0.1
            }
        }
    }
}
