//
//  RestaurantController.swift
//  WhereIAte
//
//  Created by Theo Vora on 7/13/22.
//

import CoreData

class RestaurantController {
    static let shared = RestaurantController()
    
    private lazy var fetchRequest: NSFetchRequest<Restaurant> = {
        
        let request = NSFetchRequest<Restaurant>(entityName: "Restaurant")
        
        // if false, then all the entries are not fetched/presented to the user
        request.predicate = NSPredicate(value: true)
        
        return request
    }()
    
    //Array of fetched entries
    var fetchedEntries: [Restaurant] {
        do {
            return try CoreDataStack.managedObjectContext.fetch(self.fetchRequest)
        } catch {
            print("Error fetching entries: \(error.localizedDescription)")
            return []
        }
    }
    
    func createEntry(restaurant: Restaurant) {
        CoreDataStack.saveContext()
    }
    
    func updateEntry(
        restaurant: Restaurant,
        name: String,
        cuisine: String,
        city: String,
        notes: String
    ) {
        restaurant.name = name
        restaurant.cuisine = cuisine
        restaurant.city = city
        restaurant.notes = notes
        
        CoreDataStack.saveContext()
    }
    
    /*
     Batch delete function taken from the following website.
     https://www.advancedswift.com/batch-delete-everything-core-data-swift/
     */
    func deleteEverything() {
        
        // Specify a batch to delete with a fetch request
        let fetchRequest: NSFetchRequest<NSFetchRequestResult>
        fetchRequest = NSFetchRequest(entityName: "Entry")
        
        // Create a batch delete request for the
        // fetch request
        let deleteRequest = NSBatchDeleteRequest(
            fetchRequest: fetchRequest
        )
        
        // Specify the result of the NSBatchDeleteRequest
        // should be the NSManagedObject IDs for the
        // deleted objects
        deleteRequest.resultType = .resultTypeObjectIDs
        
        // Get a reference to a managed object context
        let context = CoreDataStack.managedObjectContext
        
        // Perform the batch delete
        do {
            let batchDelete = try context.execute(deleteRequest)
            as? NSBatchDeleteResult
            
            guard let deleteResult = batchDelete?.result
                    as? [NSManagedObjectID]
            else { return }
            
            let deletedObjects: [AnyHashable: Any] = [
                NSDeletedObjectsKey: deleteResult
            ]
            
            // Merge the delete changes into the managed
            // object context
            NSManagedObjectContext.mergeChanges(
                fromRemoteContextSave: deletedObjects,
                into: [context]
            )
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
