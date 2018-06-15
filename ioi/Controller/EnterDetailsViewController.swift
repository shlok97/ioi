//
//  EnterDetailsViewController.swift
//  ioi
//
//  Created by Shlok Kapoor on 15/06/18.
//  Copyright © 2018 Shlok. All rights reserved.
//

import UIKit

class EnterDetailsViewController: UIViewController, DateTimePickerDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    var picker: DateTimePicker?
    @IBOutlet var photoshootTypePickerView: UIPickerView!
    @IBOutlet var cityPickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.photoshootTypePickerView.delegate = self
        self.cityPickerView.dataSource = self
        
        self.photoshootTypePickerView.dataSource = self
        self.cityPickerView.delegate = self
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == cityPickerView {
            return "abc"
        }
        else {
            return "xyz"
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    @IBAction func showDateTimePicker(_ sender: Any) {
        let min = Date().addingTimeInterval(0)
        let max = Date().addingTimeInterval(60 * 60 * 24 * 10)
        let picker = DateTimePicker.show(selected: Date(), minimumDate: min, maximumDate: max)
        picker.timeInterval = DateTimePicker.MinuteInterval.thirty
        picker.highlightColor = UIColor(red: 255.0/255.0, green: 138.0/255.0, blue: 138.0/255.0, alpha: 1)
        picker.darkColor = UIColor.darkGray
        picker.doneButtonTitle = "DONE"
        picker.doneBackgroundColor = UIColor(red: 255.0/255.0, green: 138.0/255.0, blue: 138.0/255.0, alpha: 1)
        picker.locale = Locale(identifier: "en_GB")
        
    picker.todayButtonTitle = "Today"
        picker.is12HourFormat = true
        picker.dateFormat = "hh:mm aa dd/MM/YYYY"
        //        picker.isTimePickerOnly = true
        picker.includeMonth = false // if true the month shows at top
        picker.completionHandler = { date in
            let formatter = DateFormatter()
            formatter.dateFormat = "hh:mm aa dd/MM/YYYY"
            self.title = formatter.string(from: date)
        }
        picker.delegate = self
        self.picker = picker
    }
    
    func dateTimePicker(_ picker: DateTimePicker, didSelectDate: Date) {
        title = picker.selectedDateString
    }

}
