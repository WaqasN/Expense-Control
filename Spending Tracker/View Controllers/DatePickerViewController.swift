//
//  DatePickerViewController.swift
//  Spending Tracker
//
//  Created by Waqas Mohammed on 2018-09-19.
//  Copyright © 2018 Waqas Mohammed. All rights reserved.
//

import UIKit

protocol DatePickerViewControllerDelegate: class {
    func datePickerViewController(_ controller: DatePickerViewController, didSelect date: Date)
}

class DatePickerViewController: UIViewController {
    @IBOutlet weak var datePicker: UIDatePicker!
    weak var delegate: DatePickerViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        datePicker.maximumDate = Date()
    }

    @IBAction func didPressDone(_ sender: Any) {
        delegate?.datePickerViewController(self, didSelect: datePicker.date)
    }
}
