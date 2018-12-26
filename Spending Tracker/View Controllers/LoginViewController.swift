//
//  LoginViewController.swift
//  Spending Tracker
//
//  Created by Waqas Mohammed on 2018-10-09.
//  Copyright © 2018 Waqas Mohammed. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()

        // TODO: This view controller can handle login in future
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
            self.performSegue(withIdentifier: "mainSegue", sender: nil)
        }
    }
}
