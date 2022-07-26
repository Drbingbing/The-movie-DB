//
//  PersistenceStore.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/22.
//

import CoreData

final class PersistenceStore<Entity: NSManagedObject>: NSObject, NSFetchedResultsControllerDelegate {
    
    private let persistentContainer: NSPersistentContainer
    
    var managedObjectContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    init(_ persistentContainer: NSPersistentContainer) {
        self.persistentContainer = persistentContainer
        super.init()
    }
}
