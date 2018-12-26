//
//  TransactionDetailViewController.swift
//  Spending Tracker
//
//  Created by Waqas Mohammed on 2018-09-09.
//  Copyright © 2018 Waqas Mohammed. All rights reserved.
//

import UIKit

class TransactionDetailViewController: UIViewController {
    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!

    var transaction: Transaction?

    override func viewDidLoad() {
        super.viewDidLoad()

        let amount = transaction?.amount ?? 0

        accountLabel.text = transaction?.account?.title
        dateLabel.text = transaction?.date.flatMap { DateFormatter.shared.string(from: $0 as Date) }
        categoryLabel.text = transaction?.category?.title
        typeLabel.text = amount > 0 ? "Income" : "Expense"
        amountLabel.text = abs(amount).currencyString
    }
}
