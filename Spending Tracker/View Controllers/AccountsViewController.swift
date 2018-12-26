//
//  AccountsViewController.swift
//  Spending Tracker
//
//  Created by Waqas Mohammed on 2018-09-08.
//  Copyright © 2018 Waqas Mohammed. All rights reserved.
//

import UIKit

class AccountsViewController: UITableViewController {
    let accounts = Account.all

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "BasicCell", bundle: nil), forCellReuseIdentifier: "cell")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BasicCell
        let account = accounts[indexPath.row]
        cell.imgBgView.backgroundColor = UIColor.themeTint.withAlphaComponent(0.9)
        cell.imgView.image = account.image
        cell.titleLabel.text = account.title
        return cell
    }
}
