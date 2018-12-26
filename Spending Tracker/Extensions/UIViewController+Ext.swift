//
//  UIViewController+Ext.swift
//  Spending Tracker
//
//  Created by Waqas Mohammed on 2018-09-09.
//  Copyright © 2018 Waqas Mohammed. All rights reserved.
//

import UIKit

extension UIViewController {
    @IBAction func didPressClose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    func showAlert(title: String = "Warning", message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true)
    }
}
