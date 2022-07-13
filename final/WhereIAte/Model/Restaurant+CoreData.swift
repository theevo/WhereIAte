//
//  Restaurant+CoreData.swift
//  WhereIAte
//
//  Created by Theo Vora on 7/13/22.
//

import CoreData

extension Restaurant {
//    @discardableResult
    convenience init(
        name: String,
        date: Date,
        cuisine: String,
        city: String,
        notes: String,
        context: NSManagedObjectContext = CoreDataStack.managedObjectContext) {
        self.init(context: context)
            self.name = name
            self.date = date
            self.cuisine = cuisine
            self.city = city
            self.notes = notes
    }
}
