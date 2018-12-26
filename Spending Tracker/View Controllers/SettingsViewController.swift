//
//  SettingsViewController.swift
//  Spending Tracker
//
//  Created by Waqas Mohammed on 2018-09-08.
//  Copyright © 2018 Waqas Mohammed. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard identifier == "exportSegue" else { return true }

        didPressExport()
        return false
    }

    func didPressExport() {
        // Step 1: Fetch all transactions
        guard let transactions = Transaction.fetchAll() else {
            print("Failed to fetch transactions")
            return
        }

        // Step 2: Prepare file content
        var dataString = "Date, Category, Account, Amount\n"
        for txn in transactions {
            dataString = dataString
                + "\(txn.date.flatMap { DateFormatter.short.string(from: $0 as Date) } ?? ""),"
                + "\(txn.category?.title ?? ""),"
                + "\(txn.account?.title ?? ""),"
                + "\(txn.amount.currencyString ?? "")\n"
        }

        // Step 3: Save and export

        let path = NSTemporaryDirectory() + "Records.csv"
        let url = URL(fileURLWithPath: path)
        FileManager.default.createFile(atPath: path, contents: NSData() as Data, attributes: nil)

        var fileHandle: FileHandle? = nil
        do {
            fileHandle = try FileHandle(forWritingTo: url)
        } catch {
            print("Error with fileHandle")
        }

        if fileHandle != nil {
            fileHandle!.seekToEndOfFile()
            let csvData = dataString.data(using: String.Encoding.utf8, allowLossyConversion: false)
            fileHandle!.write(csvData!)

            fileHandle!.closeFile()

            let activityViewController : UIActivityViewController = UIActivityViewController(
                activityItems: [url], applicationActivities: nil)

            activityViewController.excludedActivityTypes = [
                .assignToContact,
                .saveToCameraRoll,
                .postToFlickr,
                .postToVimeo,
                .postToTencentWeibo
            ]

            self.present(activityViewController, animated: true, completion: nil)
        }
    }
}

