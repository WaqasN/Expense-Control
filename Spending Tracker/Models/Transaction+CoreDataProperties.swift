//
//  Transaction+CoreDataProperties.swift
//  
//
//  Created by Waqas Mohammed on 2018-09-15.
//
//

import Foundation
import CoreData


extension Transaction {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Transaction> {
        return NSFetchRequest<Transaction>(entityName: "Transaction")
    }

    @NSManaged public var amount: Double
    @NSManaged public var date: NSDate?
    @NSManaged public var id: String?
    @NSManaged public var accountString: String?
    @NSManaged public var categoryString: String?
}
