//
//  MemoriesTableViewCell.swift
//  ioi
//
//  Created by Shlok Kapoor on 17/06/18.
//  Copyright © 2018 Shlok. All rights reserved.
//

import UIKit
import FoldingCell

fileprivate struct C {
    struct CellHeight {
        static let close: CGFloat = 100
        static let open: CGFloat = 300
    }
}

class MemoriesTableViewCell: FoldingCell, UITableViewDataSource, UITableViewDelegate {
//    @IBInspectable var itemCount: NSInteger
    
    var cellHeights = (0..<10).map { _ in C.CellHeight.close }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeights[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foldingCell") as! FoldingCell
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard case let cell as FoldingCell = tableView.cellForRow(at: indexPath) else {
            return
        }
        
        var duration = 0.0
        
        var kOpenCellHeight = C.CellHeight.open
        var kCloseCellHeight = C.CellHeight.close
        
//        if cellHeights[indexPath.row] == kCloseCellHeight { // open cell
//            cellHeights[indexPath.row] = kOpenCellHeight
//
//            cell.selectedAnimation(true, animated: true, completion: nil)
//            duration = 0.5
//        } else {// close cell
//            cellHeights[indexPath.row] = kCloseCellHeight
//            cell.selectedAnimation(false, animated: true, completion: nil)
//            duration = 1.1
//        }
        
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: {
            tableView.beginUpdates()
            tableView.endUpdates()
        }, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if case let cell as FoldingCell = cell {
//            if cellHeights[indexPath.row] == C.CellHeight.close {
//                cell.selectedAnimation(false, animated: false, completion:nil)
//            } else {
//                cell.selectedAnimation(true, animated: false, completion: nil)
//            }
        }
    }
    
    override func animationDuration(_ itemIndex:NSInteger, type:AnimationType)-> TimeInterval {
        
        // durations count equal it itemCount
        let durations = [0.33, 0.26, 0.26] // timing animation for each view
        return durations[itemIndex]
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

}
