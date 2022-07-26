//
//  CoreDataStack.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/21.
//

import CoreData

class CoreDataStack: CoreDataStackProtocol {
    
    private var persistentStoreDescriptions: [NSPersistentStoreDescription] = []
    
    lazy var persistentContainer: NSPersistentContainer = {
        let bundle = Bundle(for: CoreDataStack.self)
        guard let url = bundle.url(forResource: Constant.containerName, withExtension: "momd"),
              let model = NSManagedObjectModel(contentsOf: url) else {
            fatalError()
        }
        
        let container = NSPersistentContainer(name: Constant.containerName, managedObjectModel: model)
        
        if !persistentStoreDescriptions.isEmpty {
            container.persistentStoreDescriptions = persistentStoreDescriptions
        }
        
        container.loadPersistentStores { _, error in
            guard error == nil else { fatalError() }
        }
        
        container.viewContext.mergePolicy = NSMergePolicy.overwrite
        
        return container
    }()
    
    func setExtensionPersistentStoreDescriptions(_ groupExtensionIds: [String]) {
        persistentStoreDescriptions = groupExtensionIds.map { groupID in
            let storeURL = URL.storeURL(for: groupID, databaseName: Constant.containerName)
            let storeDescription = NSPersistentStoreDescription(url: storeURL)
            return storeDescription
        }
    }
}

extension CoreDataStack {
    
    struct Constant {
        static let containerName = "Model"
    }
}

private extension URL {
    
    static func storeURL(for appGroup: String, databaseName: String) -> URL {
        guard let fileContainer = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: appGroup) else {
            fatalError("Shared file container could not be created.")
        }
        
        return fileContainer.appendingPathComponent("\(databaseName).sqlite")
    }
    
}
