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

class BookViewController: UIViewController {

    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var cardView: CardView!
    let photoshootTypes = ["Wedding", "Commercial", "Drone"]

    @IBOutlet var darkView: UIView!
    @IBOutlet var photoshootTypeSegmentioView: PhotoshootTypeSegmentio!
    @IBOutlet var segmentioView: PhotoshootTypeSegmentioPopup!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPhotoGrid()
        setupSegmentioView()
        setupOnboardingSegmentioView()
    }

    @IBAction func donePhotoshootSelection(_ sender: LGButton) {
        UIView.animate(withDuration: 0.5) {
            self.darkView.isHidden = true
        }
    }
    
    func setupOnboardingSegmentioView() {
        darkView.isHidden = false
        darkView.backgroundColor = UIColor(hexString: "#000000", alpha: 0.5)

        segmentioView.valueDidChange = { segmentio, segmentIndex in
            self.photoshootTypeSegmentioView.selectedSegmentioIndex = segmentIndex
        }
    }
    
    func setupSegmentioView() {
        photoshootTypeSegmentioView.valueDidChange = { segmentio, segmentIndex in
            print("Selected item: ", segmentIndex)
            self.setupPhotoGrid()
        }
    }
    
    @objc func setupPhotoGrid() {
        
        let numberOfPicturesPerRow = 3
        let x = self.scrollView.frame.width/CGFloat(numberOfPicturesPerRow)
        var location = CGPoint()
        for i in 0...20 {
            let name = String(i+1)
            location = CGPoint(x: x*CGFloat(i%numberOfPicturesPerRow), y: x*CGFloat(i/numberOfPicturesPerRow))
            addPicture(at: location, withName: name)
        }
        scrollView.contentSize = CGSize(width: scrollView.frame.width, height: CGFloat(Int(21/numberOfPicturesPerRow)+1)*x)
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
