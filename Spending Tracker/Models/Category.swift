//
//  Category.swift
//  Spending Tracker
//
//  Created by Waqas Mohammed on 2018-09-19.
//  Copyright © 2018 Waqas Mohammed. All rights reserved.
//

import UIKit

enum Category: String {
    case bills              = "BILL"
    case business           = "BUSINESS"
    case clothing           = "CLOTHING"
    case education          = "EDUCATION"
    case entertainment      = "ENTERTAINMENT"
    case feesAndCharges     = "FEES"
    case foodAndDrinks      = "FOOD"
    case gifts              = "GIFTS"
    case healthAndFitness   = "HEALTH"
    case housing            = "HOUSING"
    case insurance          = "INSURANCE"
    case kids               = "KIDS"
    case medical            = "MEDICAL"
    case savings            = "SAVINGS"
    case shopping           = "SHOPPING"
    case taxes              = "TAXES"
    case transport          = "TRANSPORT"
    case miscellaneous      = "MISC"

    static var all: [Category] {
        return [
            .bills,
            .business,
            .clothing,
            .education,
            .entertainment,
            .feesAndCharges,
            .foodAndDrinks,
            .gifts,
            .healthAndFitness,
            .housing,
            .insurance,
            .kids,
            .medical,
            .savings,
            .shopping,
            .taxes,
            .transport,
            .miscellaneous
        ]
    }

    var title: String {
        switch self {
        case .bills:
            return "Bill"
        case .business:
            return "Business and Services"
        case .clothing:
            return "Clothing"
        case .education:
            return "Education"
        case .entertainment:
            return "Entertainment"
        case .feesAndCharges:
            return "Fees"
        case .foodAndDrinks:
            return "Food"
        case .gifts:
            return "Gifts"
        case .healthAndFitness:
            return "Health and Fitness"
        case .housing:
            return "Housing"
        case .insurance:
            return "Insurance"
        case .kids:
            return "Kids"
        case .medical:
            return "Medical"
        case .savings:
            return "Savings"
        case .shopping:
            return "Shopping"
        case .taxes:
            return "Taxes"
        case .transport:
            return "Transport"
        case .miscellaneous:
            return "Miscellaneous"
        }
    }

    var image: UIImage {
        switch self {
        case .bills:
            return #imageLiteral(resourceName: "icon-bill")
        case .business:
            return #imageLiteral(resourceName: "icon-bussiness")
        case .clothing:
            return #imageLiteral(resourceName: "icon-clothing")
        case .education:
            return #imageLiteral(resourceName: "icon-education")
        case .entertainment:
            return #imageLiteral(resourceName: "icon-entertainment")
        case .feesAndCharges:
            return #imageLiteral(resourceName: "icon-fee")
        case .foodAndDrinks:
            return #imageLiteral(resourceName: "icon-food")
        case .gifts:
            return #imageLiteral(resourceName: "icon-gift")
        case .healthAndFitness:
            return #imageLiteral(resourceName: "icon-fitness")
        case .housing:
            return #imageLiteral(resourceName: "icon-housing")
        case .insurance:
            return #imageLiteral(resourceName: "icon-insurance")
        case .kids:
            return #imageLiteral(resourceName: "icon-kid")
        case .medical:
            return #imageLiteral(resourceName: "icon-medical")
        case .savings:
            return #imageLiteral(resourceName: "icon-savings")
        case .shopping:
            return #imageLiteral(resourceName: "icon-shopping")
        case .taxes:
            return #imageLiteral(resourceName: "icon-tax")
        case .transport:
            return #imageLiteral(resourceName: "icon-transport")
        case .miscellaneous:
            return #imageLiteral(resourceName: "icon-more")
        }
    }

    var color: UIColor {
        switch self {
        case .bills:
            return UIColor(red: 122/255.0, green: 35/255.0, blue: 170/255.0, alpha: 1)
        case .business:
            return UIColor(red: 253/255.0, green: 98/255.0, blue: 94/255.0, alpha: 1)
        case .clothing:
            return UIColor(red: 55/255.0, green: 70/255.0, blue: 73/255.0, alpha: 1)
        case .education:
            return UIColor(red: 21/255.0, green: 135/255.0, blue: 145/255.0, alpha: 1)
        case .entertainment:
            return UIColor(red: 217/255.0, green: 80/255.0, blue: 138/255.0, alpha: 1)
        case .feesAndCharges:
            return UIColor(red: 110/255.0, green: 204/255.0, blue: 225/255.0, alpha: 1)
        case .foodAndDrinks:
            return UIColor(red: 46/255.0, green: 204/255.0, blue: 113/255.0, alpha: 1)
        case .gifts:
            return UIColor(red: 241/255.0, green: 196/255.0, blue: 15/255.0, alpha: 1)
        case .healthAndFitness:
            return UIColor(red: 231/255.0, green: 76/255.0, blue: 60/255.0, alpha: 1)
        case .housing:
            return UIColor(red: 52/255.0, green: 152/255.0, blue: 219/255.0, alpha: 1)
        case .insurance:
            return UIColor(red: 193/255.0, green: 37/255.0, blue: 82/255.0, alpha: 1)
        case .kids:
            return UIColor(red: 255/255.0, green: 102/255.0, blue: 0/255.0, alpha: 1)
        case .medical:
            return UIColor(red: 245/255.0, green: 199/255.0, blue: 0/255.0, alpha: 1)
        case .savings:
            return UIColor(red: 106/255.0, green: 150/255.0, blue: 31/255.0, alpha: 1)
        case .shopping:
            return UIColor(red: 179/255.0, green: 100/255.0, blue: 53/255.0, alpha: 1)
        case .taxes:
            return UIColor(red: 255.0/255.0, green: 115.0/255.0, blue: 170.0/255.0, alpha: 1)
        case .transport:
            return UIColor(red: 10.0/255.0, green: 100.0/255.0, blue: 255.0/255.0, alpha: 1)
        case .miscellaneous:
            return UIColor(red: 122.0/255.0, green: 193.0/255.0, blue: 67.0/255.0, alpha: 1)
        }
    }
}

extension Category: Equatable {
    public static func == (lhs: Category, rhs: Category) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
}
