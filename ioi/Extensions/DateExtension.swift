//
//  Date.swift
//  ioi
//
//  Created by Shlok Kapoor on 04/07/18.
//  Copyright © 2018 Shlok. All rights reserved.
//

import Foundation

extension Date {
    var day: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"
        let myStringafd = formatter.string(from: self)
        return myStringafd
    }
    
    var month: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM"
        let myStringafd = formatter.string(from: self)
        return myStringafd
    }
    
    var year: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY"
        let myStringafd = formatter.string(from: self)
        return myStringafd
    }
    
    var date: String {
        var date = self.day
        switch (day) {
        case "01":
            date = "1st"
        case "02":
            date = "2nd"
        case "03":
            date = "3rd"
        case "21" , "31":
            date.append("st")
        case "22":
            date.append("nd")
        case "23":
            date.append("rd")
        default:
            date.append("th")
        }
        if date.first == "0" {
            date.remove(at: String.Index.init(encodedOffset: 0))
        }
        date.append(" \(month) \(year)")
        return date
    }
}
