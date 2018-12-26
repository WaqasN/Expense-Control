//
//  TransactionsViewController.swift
//  Spending Tracker
//
//  Created by Waqas Mohammed on 2018-09-08.
//  Copyright © 2018 Waqas Mohammed. All rights reserved.
//

import UIKit

class TransactionsViewController: UITableViewController {
    var transactions: [Transaction] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.estimatedSectionHeaderHeight = 0
        tableView.sectionHeaderHeight = UITableView.automaticDimension

        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: "TransactionCell", bundle: nil), forCellReuseIdentifier: "cell")
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.destination {
        case let vc as TransactionDetailViewController:
            vc.transaction = tableView.indexPathForSelectedRow.flatMap({ transactions[$0.row] })
        default:
            break
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TransactionCell

        let transaction = transactions[indexPath.row]
        let isCredit = transaction.amount > 0

        cell.imgBgView.backgroundColor = transaction.category?.color.withAlphaComponent(0.9)
        cell.imgView.image = transaction.category?.image
        cell.titleLabel.text = transaction.category?.title
        cell.amountLabel.text = abs(transaction.amount).currencyString
        cell.amountLabel.textColor = isCredit ? .themeGreen : .themeRed

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailsSegue", sender: nil)
    }
}
