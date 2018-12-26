//
//  RecordsViewController.swift
//  Spending Tracker
//
//  Created by Waqas Mohammed on 2018-09-29.
//  Copyright © 2018 Waqas Mohammed. All rights reserved.
//

import UIKit

class RecordsViewController: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        reload()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.destination {
        case let vc as TransactionsViewController:
            vc.transactions = DataManager.shared.transactions
        default:
            break
        }
    }

    func reload() {
        let segueId = (DataManager.shared.transactions.count == 0) ? "emptySegue" : "transactionsSegue"
        performSegue(withIdentifier: segueId, sender: nil)
    }
}
