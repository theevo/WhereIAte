//
//  CoreDataStack.swift
//  WhereIAte
//
//  Created by Theo Vora on 7/13/22.

// This is foundational. will not change from app to app.
// copy / paste with no changes!

import CoreData

enum CoreDataStack {

    static let container: NSPersistentContainer = {
        //This line of code grabs the app name
        let appName = Bundle.main.object(forInfoDictionaryKey: (kCFBundleNameKey as String)) as! String

        let container = NSPersistentContainer(name: appName)
        container.loadPersistentStores() { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()

    
    static var managedObjectContext: NSManagedObjectContext {
        return container.viewContext
    }

    static func saveContext() {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                NSLog("Error saving context \(error.localizedDescription)")
            }
        }
    }
}
