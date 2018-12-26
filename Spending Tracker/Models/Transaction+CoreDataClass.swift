//
//  Transaction+CoreDataClass.swift
//  
//
//  Created by Waqas Mohammed on 2018-09-15.
//
//

import Foundation
import CoreData

@objc(Transaction)
public class Transaction: NSManagedObject {
    var category: Category? {
        return categoryString.flatMap { Category(rawValue: $0) }
    }

    var account: Account? {
        return accountString.flatMap { Account(rawValue: $0) }
    }

    static func fetchAll() -> [Transaction]? {
        return (try? NSPersistentContainer.main.viewContext.fetch(Transaction.fetchRequest())) as? [Transaction]
    }
}
