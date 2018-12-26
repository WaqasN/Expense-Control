//
//  AccountPickerViewController.swift
//  Spending Tracker
//
//  Created by Waqas Mohammed on 2018-09-19.
//  Copyright © 2018 Waqas Mohammed. All rights reserved.
//

import UIKit

protocol AccountPickerViewControllerDelegate: class {
    func accountPickerViewController(_ controller: AccountPickerViewController, didSelect account: Account)
}

class AccountPickerViewController: UIViewController {
    @IBOutlet weak var pickerView: UIPickerView!

    let accounts = Account.all
    weak var delegate: AccountPickerViewControllerDelegate?

    @IBAction func didPressDone(_ sender: Any) {
        let account = accounts[pickerView.selectedRow(inComponent: 0)]
        delegate?.accountPickerViewController(self, didSelect: account)
    }
}

extension AccountPickerViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return accounts.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return accounts[row].title
    }
}
