//
//  BookViewController.swift
//  ioi
//
//  Created by Shlok Kapoor on 11/06/18.
//  Copyright © 2018 Shlok. All rights reserved.
//

import UIKit

class BookViewController: UIViewController {

    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var cardView: CardView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPhotoGrid()
    }
    
    @objc func setupPhotoGrid() {
        let x = self.scrollView.frame.width/2
        var location = CGPoint()
        for i in 1...11 {
            let name = String(i)
            if i%2 == 0 {
                location = CGPoint(x: CGFloat(x), y: x*CGFloat((i-1)/2))
            }
            else {
                location = CGPoint(x: 0.0, y: x*CGFloat(i/2))
            }
            addPicture(at: location, withName: name)
        }
        
        scrollView.contentSize = CGSize(width: scrollView.frame.width, height: CGFloat(12/2+1)*x)
        
        scrollView.clipsToBounds = true
    }
    
    func addPicture(at location: CGPoint, withName name: String) {
        let width = self.scrollView.frame.width/2
        if let pictureView = Bundle.main.loadNibNamed("PhotoGridPicture", owner: self)?.first as? PhotoGridPictureView {
            let frame = CGRect(x: location.x, y: location.y, width: width, height: width)
            pictureView.frame = frame
            pictureView.imageView.image = UIImage(named: name)?.resize(toWidth: frame.width)
            self.scrollView.addSubview(pictureView)
        }
    }
    
    @objc func tap(pictureView: PhotoGridPictureView) {
        pictureView.toggle()
    }
}
