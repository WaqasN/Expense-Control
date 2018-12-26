//
//  TransactionCell.swift
//  Spending Tracker
//
//  Created by Waqas Mohammed on 2018-09-08.
//  Copyright © 2018 Waqas Mohammed. All rights reserved.
//

import UIKit
import CoreData

class TransactionCell: UITableViewCell {
    @IBOutlet weak var imgBgView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        titleLabel.textColor = .themeBlack
    }
}
