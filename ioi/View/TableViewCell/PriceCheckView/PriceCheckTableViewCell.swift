//
//  SecondPhotoGridTableViewCell.swift
//  ioi
//
//  Created by Shlok Kapoor on 29/06/18.
//  Copyright © 2018 Shlok. All rights reserved.
//

import UIKit
import Material
import LGButton

struct LGButtonColor {
    var gradientStart: UIColor
    var gradientEnd: UIColor
}

class PriceCheckTableViewCell: TableViewCell, UIScrollViewDelegate {
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var feeLabel: UILabel!
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var shortlistButton: LGButton!
    
    let darkView: UIView = UIView()
    
    var _isShortlisted = false
    
    let addToShortlistColor = LGButtonColor(gradientStart: UIColor(hexString: "#FFAF5B"), gradientEnd: UIColor(hexString: "#FF9E2F"))
    
    let removeFromShortlistColor = LGButtonColor(gradientStart: UIColor(hexString: "#4380A4"), gradientEnd: UIColor(hexString: "#366B97"))
    
    func toggle() {
        if _isShortlisted {
            _isShortlisted = false
        }
        else {
            _isShortlisted = true
        }
        
        setShortlistButton()
    }
    
    func setShortlistButton() {
        
        if _isShortlisted {
            shortlistButton.titleString = "REMOVE FROM SHORTLIST"
            
            shortlistButton.gradientEndColor = removeFromShortlistColor.gradientEnd
            shortlistButton.gradientStartColor = removeFromShortlistColor.gradientStart
            
            
        }
        else {
            shortlistButton.titleString = "ADD TO SHORTLIST"
            shortlistButton.gradientEndColor = addToShortlistColor.gradientEnd
            shortlistButton.gradientStartColor = addToShortlistColor.gradientStart
        }
    }
    
    @IBAction func shortlistButtonTapped(_ sender: Any) {
        toggle()
    }
    
    var isShortlisted: Bool {
        return _isShortlisted
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.clipsToBounds = true
        
        setShortlistButton()
    }
    
    func setupCell() {
        
        for subview in scrollView.subviews {
            subview.removeFromSuperview()
        }
        
        addImagesToScrollView()
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        scrollView.showsHorizontalScrollIndicator = false
    }
    
    func addImagesToScrollView() {
        
        let padding = CGFloat(8)
        let scrollViewWidth = self.scrollView.frame.width
        
        let width = self.scrollView.frame.width - 2*padding
        let height = self.scrollView.frame.height
        
        
        var xPosition = padding
        pageControl.numberOfPages = 0
        for _ in 0...5 {
            if let view = Bundle.main.loadNibNamed("PriceCheckPhotoView", owner: self, options: nil)?.first as? PriceCheckPhotoView {
                print(xPosition)
                view.frame = CGRect(x: xPosition, y: 0, width: width, height: height)
                scrollView.addSubview(view)
                xPosition += scrollViewWidth
                scrollView.contentSize = CGSize(width: xPosition - padding, height: scrollView.frame.height)
                
                pageControl.numberOfPages += 1
            }
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset)
        pageControl.currentPage = Int((scrollView.contentOffset.x/scrollView.frame.width) + 0.5)
        print(scrollView.contentOffset.x/scrollView.frame.width)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
    }
}
