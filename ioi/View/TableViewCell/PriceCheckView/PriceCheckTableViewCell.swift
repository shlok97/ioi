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

class PriceCheckTableViewCell: TableViewCell, UIScrollViewDelegate {
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var feeLabel: UILabel!
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var shortlistButton: LGButton!
    
    let darkView: UIView = UIView()
    
    var _isShortlisted = false
    
    @objc func toggle() {
        if _isShortlisted {
            shortlistButton.titleString = "SHORTLIST"
            _isShortlisted = false
        }
        else {
            shortlistButton.titleString = "REMOVE FROM SHORTLIST"
            _isShortlisted = true
        }
        UIView.animate(withDuration: 0.15) {
            if self.isShortlisted {
                self.darkView.alpha = 0.7
                return
            }
            self.darkView.alpha = 0
        }
    }
    
    var isShortlisted: Bool {
        return _isShortlisted
    }
    
    override func awakeFromNib() {
        self.clipsToBounds = true
        darkView.alpha = 0
        darkView.backgroundColor = .clear
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(toggle))
        tap.numberOfTapsRequired = 1
        self.addGestureRecognizer(tap)
        
        shortlistButton.addTarget(self, action: #selector(toggle), for: .touchUpInside)
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
