//
//  MemoriesViewController.swift
//  ioi
//
//  Created by Shlok Kapoor on 17/06/18.
//  Copyright © 2018 Shlok. All rights reserved.
//

import UIKit
import ElongationPreview

class MemoriesViewController: ElongationViewController {
    
    var datasource: [Villa] = Villa.testData
    
    // MARK: Lifecycle 🌎
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func openDetailView(for indexPath: IndexPath) {
        let id = String(describing: EventPhotosViewController.self)
        guard let detailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: id) as? EventPhotosViewController else { return }
        let villa = datasource[indexPath.row]
        detailViewController.title = villa.title
        expand(viewController: detailViewController)
    }

}

// MARK: - Setup ⛏

private extension MemoriesViewController {
    
    func setup() {
        tableView.backgroundColor = UIColor.black
        tableView.register(UINib(nibName: "DemoElongationCell", bundle: nil), forCellReuseIdentifier: "demoElongationCell")
    }
}

// MARK: - TableView 📚

extension MemoriesViewController {
    
    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return datasource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt _: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "demoElongationCell") as! DemoElongationCell
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        super.tableView(tableView, willDisplay: cell, forRowAt: indexPath)
        guard let cell = cell as? DemoElongationCell else { return }
        
        let villa = datasource[indexPath.row]
        
        let attributedLocality = NSMutableAttributedString(string: villa.locality.uppercased(), attributes: [
            NSAttributedStringKey.font: UIFont.robotoFont(ofSize: 22, weight: .medium),
            NSAttributedStringKey.kern: 8.2,
            NSAttributedStringKey.foregroundColor: UIColor.white,
            ])
        
        cell.topImageView?.image = UIImage(named: villa.imageName)
        cell.localityLabel?.attributedText = attributedLocality
        cell.countryLabel?.text = villa.country
        cell.aboutTitleLabel?.text = villa.title
        cell.aboutDescriptionLabel?.text = villa.description
    }
}
