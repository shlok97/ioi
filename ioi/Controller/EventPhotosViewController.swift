//
//  EventPhotosViewController.swift
//  ioi
//
//  Created by Shlok Kapoor on 27/06/18.
//  Copyright © 2018 Shlok. All rights reserved.
//

import UIKit
import ElongationPreview

class EventPhotosViewController: ElongationDetailViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .black
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "GridViewCell", bundle: nil), forCellReuseIdentifier: "girdViewCell")
    }
    
    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt _: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "girdViewCell") as! GridViewCell
        return cell
    }
    
    override func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        let appearance = ElongationConfig.shared
        let headerHeight = appearance.topViewHeight + appearance.bottomViewHeight
        let screenHeight = UIScreen.main.bounds.height
        return screenHeight - headerHeight
    }

}
