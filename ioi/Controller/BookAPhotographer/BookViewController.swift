//
//  BookViewController.swift
//  ioi
//
//  Created by Shlok Kapoor on 11/06/18.
//  Copyright © 2018 Shlok. All rights reserved.
//

import UIKit
import Segmentio
import LGButton

class BookViewController: UIViewController, PhotoshootTypePopupViewDelegate {
    
    func changedPhotoshootCategory(_ index: Int) {
        self.photoshootTypeSegmentioView.selectedSegmentioIndex = index
    }
    
    func continueButtonTapped() {
        self.darkView.alpha = 0
    }
    

    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var cardView: CardView!
    let photoshootTypes = ["Wedding", "Commercial", "Drone"]

    @IBOutlet var darkView: UIView!
    @IBOutlet var photoshootTypeSegmentioView: PhotoshootTypeSegmentio!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupPhotoGrid()
        setupSegmentioView()
        setupOnboardingSegmentioView()
    }
    
    func setupOnboardingSegmentioView() {
        self.darkView.alpha = 1
        darkView.backgroundColor = UIColor(hexString: "#000000", alpha: 0.5)
        if let view = Bundle.main.loadNibNamed("PhotoshootTypePopupView", owner: self, options: nil)?.first as? PhotoshootTypePopupView {
            view.delegate = self
            view.frame = self.popupFrame
            self.darkView.addSubview(view)
        }
    }
    
    func setupSegmentioView() {
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(showPopup))
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(showPopup))
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(showPopup))
        swipe.direction = .down
        doubleTap.numberOfTapsRequired = 2
        
        photoshootTypeSegmentioView.addGestureRecognizer(doubleTap)
        photoshootTypeSegmentioView.addGestureRecognizer(swipe)
        photoshootTypeSegmentioView.addGestureRecognizer(longPress)
        photoshootTypeSegmentioView.valueDidChange = { segmentio, segmentIndex in
            self.setupPhotoGrid()
        }
    }
    
    @objc func showPopup() {
        self.darkView.alpha = 1
    }
    
    @objc func setupPhotoGrid() {
        
        for subview in scrollView.subviews {
            subview.removeFromSuperview()
        }
        
        let numberOfPicturesPerRow = 3
        let x = self.scrollView.frame.width/CGFloat(numberOfPicturesPerRow)
        var location = CGPoint()
        for i in 0...20 {
            let name = String(i+1)
            location = CGPoint(x: x*CGFloat(i%numberOfPicturesPerRow), y: x*CGFloat(i/numberOfPicturesPerRow))
            addPicture(at: location, withName: name)
        }
        scrollView.contentSize = CGSize(width: scrollView.frame.width, height: CGFloat(Int(21/numberOfPicturesPerRow))*x)
        scrollView.clipsToBounds = true
        scrollView.backgroundColor = UIColor.black
        scrollView.showsVerticalScrollIndicator = false
    }
    
    func addPicture(at location: CGPoint, withName name: String) {
        let width = self.scrollView.frame.width/3
        if let pictureView = Bundle.main.loadNibNamed("PhotoGridPicture", owner: self)?.first as? PhotoGridPictureView {
            let frame = CGRect(x: location.x, y: location.y, width: width, height: width)
            pictureView.frame = frame
            pictureView.imageView.randomImage()
            self.scrollView.addSubview(pictureView)
        }
    }
    
    @objc func tap(pictureView: PhotoGridPictureView) {
        pictureView.toggle()
    }
}

extension BookViewController {
    var popupFrame: CGRect {
        let width: CGFloat = 300
        let height: CGFloat = 200
        let centerX = self.darkView.frame.width/2
        let centerY = self.darkView.frame.height/2
        let x = centerX - width/2
        let y = centerY - height/2
        return CGRect(x: x, y: y, width: width, height: height)
    }
}
