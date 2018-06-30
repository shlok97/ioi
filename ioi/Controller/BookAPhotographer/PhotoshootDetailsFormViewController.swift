//
//  PhotoshootDetailsFormViewController.swift
//  ioi
//
//  Created by Shlok Kapoor on 29/06/18.
//  Copyright © 2018 Shlok. All rights reserved.
//

import UIKit

class PhotoshootDetailsFormViewController: UIViewController, DateTimePickerDelegate {
    
    var picker: DateTimePicker?
    var photoshootStartDate: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        showDateTimePicker(self)
        self.hideKeyboardWhenTappedAround()
    }

    @IBAction func changeDate(_ sender: Any) {
        showDateTimePicker(sender)
    }
}

extension PhotoshootDetailsFormViewController {
    @IBAction func showDateTimePicker(_ sender: Any) {
        let min = Date().addingTimeInterval(0)
        let max = Date().addingTimeInterval(60 * 60 * 24 * 10)
        let picker = DateTimePicker.show(selected: Date(), minimumDate: min, maximumDate: max)
        picker.timeInterval = DateTimePicker.MinuteInterval.thirty
        picker.highlightColor = UIColor(hexString: "#FF9300")
        picker.darkColor = UIColor.darkGray
        picker.doneButtonTitle = "SET START DATE"
        picker.doneBackgroundColor = UIColor(hexString: "#FF9300")
        picker.locale = Locale(identifier: "en_GB")
        
        picker.todayButtonTitle = "Today"
        picker.is12HourFormat = true
        picker.dateFormat = "hh:mm aa dd/MM/YYYY"
        //        picker.isTimePickerOnly = true
        picker.includeMonth = true // if true the month shows at top
        picker.completionHandler = { date in
            let formatter = DateFormatter()
            formatter.dateFormat = "hh:mm aa dd/MM/YYYY"
            self.title = formatter.string(from: date)
        }
        picker.delegate = self
        self.picker = picker
    }
    
    func dateTimePicker(_ picker: DateTimePicker, didSelectDate: Date) {
//        picker.title = "ENTER START DATE"
        photoshootStartDate = didSelectDate.description
    }
}
