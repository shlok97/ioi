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
    }
    
    func addPicture(at location: CGPoint, withName name: String) {
        let width = self.scrollView.frame.width/3
        if let pictureView = Bundle.main.loadNibNamed("PhotoGridPicture", owner: self)?.first as? PhotoGridPictureView {
            let frame = CGRect(x: location.x, y: location.y, width: width, height: width)
            pictureView.frame = frame
            
            let randomNumber = Int(arc4random_uniform(1000))
            pictureView.imageView.downloadedFrom(link: "https://picsum.photos/200/200?image=\(randomNumber)")
            pictureView.imageView.contentMode = .scaleAspectFill
            self.scrollView.addSubview(pictureView)
        }
    }
    
    @objc func tap(pictureView: PhotoGridPictureView) {
        pictureView.toggle()
    }
}
