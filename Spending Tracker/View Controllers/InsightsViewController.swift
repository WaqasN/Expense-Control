//
//  InsightsViewController.swift
//  Spending Tracker
//
//  Created by Waqas Mohammed on 2018-09-08.
//  Copyright © 2018 Waqas Mohammed. All rights reserved.
//

import UIKit
import Charts

class InsightsViewController: UIViewController {
    @IBOutlet var chartView: PieChartView!
    @IBOutlet var totalAmountLabel: UILabel!
    @IBOutlet var tableView: UITableView!

    var selectedCategory: Category?

    var groupedTransactions: [[Transaction]] = []
    var filteredTransactions: [[Transaction]] {
        guard let category = selectedCategory else { return groupedTransactions }
        for txns in groupedTransactions where txns.first?.category == category {
            return [txns]
        }
        return []
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        chartView.backgroundColor = .themeTint
        chartView.holeColor = .clear
        chartView.legend.enabled = false
        chartView.chartDescription?.enabled = false
        chartView.delegate = self

        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: "TransactionCell", bundle: nil), forCellReuseIdentifier: "cell")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        updateGroupedTransactions()
        reloadChart()
        tableView.reloadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch (segue, segue.destination) {
        case (_, let vc as TransactionsViewController):
            let category = tableView.indexPathForSelectedRow.flatMap { filteredTransactions[$0.row] }?.first?.category
            vc.transactions = groupedTransactions.first { $0.first?.category == category } ?? []
        default:
            break
        }
    }

    func updateGroupedTransactions() {
        var groups = [Category: [Transaction]]()
        DataManager.shared.transactions.forEach {
            guard let category = $0.category else { return }
            var array = groups[category] ?? []
            array.append($0)
            groups[category] = array
        }

        groupedTransactions = groups.compactMap({ (_, value) in return value })
    }

    func reloadChart() {
        totalAmountLabel.text = self.groupedTransactions.reduce(0, { $0 + $1.reduce(0, { $0 + $1.amount }) }).currencyString

        let groupedTransactions = self.groupedTransactions.filter { ($0.first?.amount ?? 0.0) <= 0.0 }
        
        let entries = (0..<groupedTransactions.count).map { (i) -> PieChartDataEntry in
            let transactions = groupedTransactions[i]
            let category = transactions.first?.category
            let amount = transactions.reduce(0, { $0 + ($1.amount < 0 ? abs($1.amount) : 0) })
            return PieChartDataEntry(value: amount,
                                     icon: category?.image,
                                     data: category?.rawValue as AnyObject)
        }

        let set = PieChartDataSet(values: entries, label: nil)
        set.drawValuesEnabled = false
        set.colors = groupedTransactions.compactMap({ $0.first?.category?.color })

        let data = PieChartData(dataSet: set)

        chartView.data = data
        chartView.highlightValues(nil)
    }
}

extension InsightsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredTransactions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TransactionCell

        let transactions = filteredTransactions[indexPath.row]
        let category = transactions.first?.category
        let amount = transactions.reduce(0) { $0 + $1.amount }
        let isCredit = amount > 0

        cell.imgBgView.backgroundColor = category?.color.withAlphaComponent(0.9)
        cell.imgView.image = category?.image
        cell.titleLabel.text = category?.title
        cell.amountLabel.text = abs(amount).currencyString
        cell.amountLabel.textColor = isCredit ? .themeGreen : .themeRed

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "transactionsSegue", sender: nil)
    }
}

extension InsightsViewController: ChartViewDelegate {
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        guard let entry = entry as? PieChartDataEntry, let value = entry.data as? String else { return }

        selectedCategory = Category(rawValue: value)
        tableView.reloadData()
    }

    func chartValueNothingSelected(_ chartView: ChartViewBase) {
        selectedCategory = nil
        tableView.reloadData()
    }
}
