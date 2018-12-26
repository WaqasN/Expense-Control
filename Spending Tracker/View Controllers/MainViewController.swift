//
//  MainViewController.swift
//  Spending Tracker
//
//  Created by Waqas Mohammed on 2018-09-08.
//  Copyright © 2018 Waqas Mohammed. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
    }

    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if let nav = viewController as? UINavigationController, nav.topViewController is AddTransactionViewController {
            performSegue(withIdentifier: "addTransactionSegue", sender: nil)
            return false
        }

        return true
    }
}
