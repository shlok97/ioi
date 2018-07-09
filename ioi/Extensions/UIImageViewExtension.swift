//
//  UIImageViewExtention.swift
//  ioi
//
//  Created by Shlok Kapoor on 10/06/18.
//  Copyright © 2018 Shlok. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
    
    func randomImage() {
        let randomNumber = Int(arc4random_uniform(300) + 100)
        downloadedFrom(link: "https://picsum.photos/400/400?image=\(randomNumber)")
        self.contentMode = .scaleAspectFill
    }
    func randomUserImage() {
        self.roundCorners()
        let randomNumber = Int(arc4random_uniform(100))
        downloadedFrom(link: "https://randomuser.me/api/portraits/men/\(randomNumber).jpg")
        self.contentMode = .scaleAspectFill
        
    }
}
