//
//  PickInterestsViewController.swift
//  ioi
//
//  Created by Shlok Kapoor on 10/06/18.
//  Copyright © 2018 Shlok. All rights reserved.
//

import UIKit

class PickInterestsViewController: UIViewController {

    @IBOutlet weak var interestsScrollView: InterestsScrollView!
    var interestCategoriesData = Interests()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addInterests()
    }
    
    func addInterests() {
        interestCategoriesData.setInterests()
        let padding: CGFloat = 8
        let width: CGFloat = (self.view.frame.width - 32)/2 - 1.5*padding
        let height = width*2/3
        var interestCount: Int = 0
        var contentHeight: CGFloat = 0.0
        let contentWidth: CGFloat = self.view.frame.width - 32
        for interest in interestCategoriesData.interestCategories {
            let interestViewFrame = CGRect(x: padding + CGFloat(interestCount%2)*(width + padding), y: padding + CGFloat(interestCount/2)*(height + padding), width: width, height: height)
            
            let interestView = InterestView(frame: interestViewFrame)
            interestView.setup(interest: interest)
            self.interestsScrollView.addSubview(interestView)
            interestCount += 1
            if interestCount%2 == 0 {
                contentHeight += height*1.3 + padding
            }
        }
        print(contentHeight)
        self.interestsScrollView.contentSize = CGSize(width: contentWidth, height: contentHeight)
    }

}
