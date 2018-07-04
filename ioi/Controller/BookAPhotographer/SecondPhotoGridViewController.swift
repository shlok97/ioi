//
//  BookingSecondPhotoGridViewController.swift
//  ioi
//
//  Created by Shlok Kapoor on 29/06/18.
//  Copyright © 2018 Shlok. All rights reserved.
//

import UIKit

class SecondPhotoGridViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.reloadData()
        tableView.backgroundColor = UIColor.clear
        tableView.roundCorners()
        tableView.showsVerticalScrollIndicator = false
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "photogridCell") as! SecondPhotoGridTableViewCell
        cell.photoGridImageView.randomImage()
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
}

extension UIView {
    func roundCorners(withRadius radius: CGFloat = 10) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
}
