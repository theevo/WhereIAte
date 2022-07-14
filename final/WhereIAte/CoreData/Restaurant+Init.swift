//
//  Restaurant+Init.swift
//  WhereIAte
//
//  Created by Theo Vora on 7/13/22.
//

import CoreData

extension Restaurant {
    convenience init(
        name: String,
        cuisine: String,
        city: String,
        notes: String,
        context: NSManagedObjectContext = CoreDataStack.managedObjectContext) {
        self.init(context: context)
            self.name = name
            self.cuisine = cuisine
            self.city = city
            self.notes = notes
    }
}
