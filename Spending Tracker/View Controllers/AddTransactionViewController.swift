//
//  AddTransactionViewController.swift
//  Spending Tracker
//
//  Created by Waqas Mohammed on 2018-09-09.
//  Copyright © 2018 Waqas Mohammed. All rights reserved.
//

import UIKit
import CoreData

class AddTransactionViewController: UIViewController {
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        accountLabel.text = Account.cash.title
        categoryLabel.text = Category.foodAndDrinks.title
        dateLabel.text = DateFormatter.shared.string(from: Date())
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.destination {
        case let vc as CategoryViewController:
            vc.delegate = self
        case let nav as UINavigationController where nav.topViewController is AccountPickerViewController:
            nav.preferredContentSize = CGSize(width: UIScreen.main.bounds.width, height: 190)
            let vc = nav.topViewController as? AccountPickerViewController
            vc?.delegate = self
        case let nav as UINavigationController where nav.topViewController is DatePickerViewController:
            nav.preferredContentSize = CGSize(width: UIScreen.main.bounds.width, height: 190)
            let vc = nav.topViewController as? DatePickerViewController
            vc?.delegate = self
        default:
            break
        }
    }

    @IBAction func didPressDone(_ sender: Any) {

        let amount = Double(amountLabel.text ?? "") ?? 0.0
        let isExpense = segmentedControl.selectedSegmentIndex == 0

        guard amount > 0.0 else {
            showAlert(message: "Did you forget to update amount?")
            return
        }

        guard let transaction = Transaction.create(in: NSPersistentContainer.main.viewContext) as? Transaction else {
            print("Transaction creation failed")
            return
        }

        transaction.id = UUID().uuidString
        transaction.date = DateFormatter.shared.date(from: dateLabel.text ?? "") as NSDate? ?? NSDate()
        transaction.amount = amount * (isExpense ? -1 : 1)
        transaction.categoryString = Category.all.first(where: { $0.title == categoryLabel.text })?.rawValue
        transaction.accountString = Account.all.first(where: { $0.title == accountLabel.text })?.rawValue

        do {
            try NSPersistentContainer.main.viewContext.save()
            DataManager.shared.updateTransactions {
                self.dismiss(animated: true, completion: nil)
            }
        } catch {
            showAlert(title: "Error", message: error.localizedDescription)
        }
    }

    @IBAction func didPressKeyboard(_ sender: UIButton) {
        var text = amountLabel.text ?? ""

        if sender.tag == 10 && !text.contains(".") {
            text.append(".")
        } else if sender.tag == 11 && text.count > 0 {
            text.removeLast(1)

            if text.count == 0 {
                text = "0"
            }
        } else if sender.tag >= 0 && sender.tag <= 9 {
            if text.replacingOccurrences(of: "0", with: "").count == 0 {
                text = ""
            }

            text.append("\(sender.tag)")
        }

        amountLabel.text = text
    }
}

extension AddTransactionViewController: CategoryViewControllerDelegate {
    func categoryViewController(_ controller: CategoryViewController, didSelect category: Category) {
        categoryLabel.text = category.title

        navigationController?.popViewController(animated: true)
    }
}

extension AddTransactionViewController: AccountPickerViewControllerDelegate {
    func accountPickerViewController(_ controller: AccountPickerViewController, didSelect account: Account) {
        accountLabel.text = account.title

        controller.dismiss(animated: true)
    }
}

extension AddTransactionViewController: DatePickerViewControllerDelegate {
    func datePickerViewController(_ controller: DatePickerViewController, didSelect date: Date) {
        dateLabel.text = DateFormatter.shared.string(from: date)

        controller.dismiss(animated: true)
    }
}
