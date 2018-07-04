//
//  PhotoshootDetailsFormViewController.swift
//  ioi
//
//  Created by Shlok Kapoor on 29/06/18.
//  Copyright © 2018 Shlok. All rights reserved.
//

import UIKit
import EMAlertController

class PhotoshootDetailsFormViewController: UIViewController, DateTimePickerDelegate {
    
    @IBOutlet var startDateLabel: UILabel!
    @IBOutlet var endDateLabel: UILabel!
    
    @IBOutlet var durationTextField: UITextField!
    @IBOutlet var durationStepper: UIStepper!
    
    var duration = 1
    
    var picker: DateTimePicker = DateTimePicker()
    
    var endDatePicker: DateTimePicker = DateTimePicker()
    var selectedStartDate: Date = Date().addingTimeInterval(60 * 60 * 24 * 30)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showStartDatePicker()
        self.hideKeyboardWhenTappedAround()
        setDurationTextField()
        setStartDate()
        setupDurationStepper()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        showDatePickerOnTap()
        addKeyboardObservers()
    }
    
    func addKeyboardObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear), name: Notification.Name.UIKeyboardWillHide, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: Notification.Name.UIKeyboardWillShow, object: nil)
    }
    
    @objc func keyboardWillAppear(notification: NSNotification){
        // Do something here
        startDateLabel.isUserInteractionEnabled = false
        endDateLabel.isUserInteractionEnabled = false
    }
    
    @objc func keyboardWillDisappear(notification: NSNotification){
        // Do something here
        startDateLabel.isUserInteractionEnabled = true
        endDateLabel.isUserInteractionEnabled = true
    }
    
    func setDurationTextField() {
        durationTextField.text = String(duration)
        durationStepper.value = Double(duration)
    }
    
    func showDatePickerOnTap() {
        var tap = UITapGestureRecognizer(target: self, action: #selector(showStartDatePicker))
        tap.numberOfTapsRequired = 1
        endDateLabel.isUserInteractionEnabled = true
        startDateLabel.isUserInteractionEnabled = true
        
        startDateLabel.addGestureRecognizer(tap)
        
        tap = UITapGestureRecognizer(target: self, action: #selector(showEndDatePicker))
        endDateLabel.addGestureRecognizer(tap)
    }
    
    func setupDurationStepper() {
        durationStepper.stepValue = 1
        durationStepper.minimumValue = 1
        durationStepper.maximumValue = 15
        durationStepper.value = 1
        durationStepper.autorepeat = true
    }
    
    func setEndDate() {
        let photoshootEndDate: Date = selectedStartDate.addingTimeInterval(TimeInterval(60 * 60 * 24 * (duration-1)))
        endDateLabel.text = photoshootEndDate.date
    }
    
    func setStartDate() {
        startDateLabel.text = selectedStartDate.date
        setEndDate()
    }

    @IBAction func changeDate(_ sender: Any) {
        showDateTimePicker(picker: &picker)
    }
    
    @IBAction func changeDuration(_ sender: Any) {
        
        if durationTextField.text == "" {
            duration = 1
            setDurationTextField()
        }
        
        if let durationString = durationTextField.text {
            if let duration = Int(durationString) {
                if duration > 15 {
                    self.duration = 15
                }
                else {
                    self.duration = duration
                }
            }
        }
        setDurationTextField()
        setEndDate()
    }
    
    @IBAction func stepperChanged(_ sender: Any) {
        duration = Int(durationStepper.value)
        setDurationTextField()
        setEndDate()
    }
    
    
    @IBAction func confirmDetails(_ sender: Any) {
        showConfirmDetailsAlert()
    }
    
    func showConfirmDetailsAlert(photographerName: String? = nil) {
        var name = photographerName
        if photographerName == nil {
            name = "a photographer"
        }
        
        let alert = EMAlertController(title: "Confirm Details", message: "Are you sure you want to request \(name!) from \(startDateLabel.text!) to \( endDateLabel.text!)?")
        
        let confirm = EMAlertAction(title: "YES", style: .normal) {
            self.performSegue(withIdentifier: "confirmRequestSegue", sender: self)
        }
        let changeDates = EMAlertAction(title: "CHANGE DATES", style: .cancel)
        
        alert.addAction(action: confirm)
        alert.addAction(action: changeDates)
        alert.backgroundViewAlpha = 0.5
        self.present(alert, animated: true)
    }
    
}

extension PhotoshootDetailsFormViewController {
    
    @objc func showStartDatePicker() {
        showDateTimePicker(picker: &picker)
    }
    @objc func showEndDatePicker() {
        showDateTimePicker(picker: &endDatePicker)
    }
    
    func showDateTimePicker(picker: inout DateTimePicker) {
        
        
        let min = Date().addingTimeInterval(0)
        let max = Date().addingTimeInterval(60 * 60 * 24 * 365)
        
        
        
        picker = DateTimePicker.show(selected: Date(), minimumDate: min, maximumDate: max)
        
        
        picker.timeInterval = DateTimePicker.MinuteInterval.thirty
        picker.highlightColor = UIColor(hexString: "#FF9300")
        picker.darkColor = UIColor.darkGray
        picker.doneButtonTitle = "SET START DATE"
        
        if picker == self.endDatePicker {
            picker.minimumDate = self.selectedStartDate
            picker.maximumDate = self.selectedStartDate.addingTimeInterval(TimeInterval(60 * 60 * 24 * 14))
            picker.selectedDate = self.selectedStartDate.addingTimeInterval(TimeInterval(60 * 60 * 24 * (duration-1)))
            picker.doneButtonTitle = "SET END DATE"
        } else {
            picker.selectedDate = self.selectedStartDate
        }
        
        picker.doneBackgroundColor = UIColor(hexString: "#FF9300")
        picker.locale = Locale(identifier: "en_GB")
        
        picker.todayButtonTitle = "Today"
        picker.is12HourFormat = true
        picker.dateFormat = "hh:mm aa dd/MM/YYYY"
        
        picker.includeMonth = true
        
        
        picker.completionHandler = { date in
            let formatter = DateFormatter()
            formatter.dateFormat = "hh:mm aa dd/MM/YYYY"
            self.title = formatter.string(from: date)
        }
        picker.delegate = self
    }
    
    func dateTimePicker(_ picker: DateTimePicker, didSelectDate: Date) {
        if picker == self.picker {
            selectedStartDate = didSelectDate
            setStartDate()
        } else {
            duration = Calendar.current.dateComponents([.day], from: selectedStartDate, to: didSelectDate.addingTimeInterval(60 * 60 * 24)).day!
            setDurationTextField()
            setEndDate()
        }
    }
}
