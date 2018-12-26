//
//  CategoryViewController.swift
//  Spending Tracker
//
//  Created by Waqas Mohammed on 2018-09-19.
//  Copyright © 2018 Waqas Mohammed. All rights reserved.
//

import UIKit

protocol CategoryViewControllerDelegate: class {
    func categoryViewController(_ controller: CategoryViewController, didSelect category: Category)
}

class CategoryViewController: UITableViewController {
    let categories = Category.all
    weak var delegate: CategoryViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: "BasicCell", bundle: nil), forCellReuseIdentifier: "cell")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BasicCell

        let category = categories[indexPath.row]
        cell.imgBgView.backgroundColor = category.color.withAlphaComponent(0.9)
        cell.imgView.image = category.image
        cell.titleLabel.text = category.title

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = categories[indexPath.row]
        delegate?.categoryViewController(self, didSelect: category)
    }
}
