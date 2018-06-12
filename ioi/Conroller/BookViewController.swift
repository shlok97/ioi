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
        
        scrollView.frame = CGRect(x: 0, y: 30, width: self.cardView.frame.width, height: self.cardView.frame.height - 30)
        
        let location = CGPoint(x: 0, y: 0)
        addPicture(at: location)
        
        let x = self.scrollView.frame.width/2
        let location_2 = CGPoint(x: x, y: 0)
        addPicture(at: location_2)
        
        
    }
    
    func addPicture(at location: CGPoint) {
        let width = self.scrollView.frame.width/2
        if let pictureView = Bundle.main.loadNibNamed("PhotoGridPicture", owner: self)?.first as? PhotoGridPictureView {
            let frame = CGRect(x: location.x, y: location.y, width: width, height: width)
            pictureView.frame = frame
            self.scrollView.addSubview(pictureView)
        }
    }
    
    @objc func tap(pictureView: PhotoGridPictureView) {
        pictureView.toggle()
    }
}
