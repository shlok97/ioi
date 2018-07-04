//
//  PhotoshootDetailsFormViewController.swift
//  ioi
//
//  Created by Shlok Kapoor on 29/06/18.
//  Copyright © 2018 Shlok. All rights reserved.
//

import UIKit

class PhotoshootDetailsFormViewController: UIViewController, DateTimePickerDelegate {
    
    @IBOutlet var startDateLabel: UILabel!
    @IBOutlet var endDateLabel: UILabel!
    
    @IBOutlet var durationTextField: UITextField!
    @IBOutlet var durationStepper: UIStepper!
    
    var duration = 1
    
    var picker: DateTimePicker?
    var photoshootStartDate: Date = Date()
    var selectedDate: Date = Date().addingTimeInterval(60 * 60 * 24 * 30)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showDateTimePicker(self)
        self.hideKeyboardWhenTappedAround()
        durationTextField.text = "1"
        if let photoshootStartDate = (picker?.selectedDate) {
            self.photoshootStartDate = photoshootStartDate
        }
        setStartDate()
        setupDurationStepper()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        showDatePickerOnTap()
    }
    
    func showDatePickerOnTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(showDateTimePicker(_:)))
        tap.numberOfTapsRequired = 1
        endDateLabel.isUserInteractionEnabled = true
        startDateLabel.isUserInteractionEnabled = true
        endDateLabel.addGestureRecognizer(tap)
        startDateLabel.addGestureRecognizer(tap)
    }
    
    func setupDurationStepper() {
        durationStepper.stepValue = 1
        durationStepper.minimumValue = 1
        durationStepper.maximumValue = 15
        durationStepper.value = 1
        durationStepper.autorepeat = true
    }
    
    func setEndDate() {
        let photoshootEndDate: Date = photoshootStartDate.addingTimeInterval(TimeInterval(60 * 60 * 24 * (duration-1)))
        endDateLabel.text = photoshootEndDate.date
    }
    
    func setStartDate() {
        startDateLabel.text = photoshootStartDate.date
        setEndDate()
    }

    @IBAction func changeDate(_ sender: Any) {
        showDateTimePicker(sender)
    }
    @IBAction func changeDuration(_ sender: Any) {
        
        if durationTextField.text == "" {
            durationTextField.text = "1"
        }
        
        if let durationString = durationTextField.text {
            if let duration = Int(durationString) {
                if duration > 15 {
                    self.duration = 15
                    durationTextField.text = "\(self.duration)"
                }
                else {
                    self.duration = duration
                }
            }
        }
        
        durationStepper.value = Double(duration)
        setEndDate()
    }
    
    @IBAction func stepperChanged(_ sender: Any) {
        duration = Int(durationStepper.value)
        durationTextField.text = String(duration)
        setEndDate()
    }
}

extension PhotoshootDetailsFormViewController {
    
    func showStartDatePicker() {
        
    }
    func showEndDatePicker() {
        
    }
    @objc func showDateTimePicker(_ sender: Any) {
        let min = Date().addingTimeInterval(0)
        let max = Date().addingTimeInterval(60 * 60 * 24 * 365)
        
       
        
        let picker = DateTimePicker.show(selected: Date(), minimumDate: min, maximumDate: max)
        picker.selectedDate = self.selectedDate
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
        photoshootStartDate = didSelectDate
        selectedDate = photoshootStartDate
        print(photoshootStartDate.date)
        setStartDate()
    }
    
    
}

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
