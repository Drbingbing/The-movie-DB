//
//  Managed.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/22.
//

import Foundation
import Combine
import CoreData

protocol Managed: NSFetchRequestResult {
    
    static var entityName: String { get }
    static var defaultSortDescriptors: [NSSortDescriptor] { get }
}

extension Managed {
    
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return []
    }
    
    static var sortedFetchRequest: NSFetchRequest<Self> {
        let request = NSFetchRequest<Self>(entityName: entityName)
        request.sortDescriptors = defaultSortDescriptors
        return request
    }
}

extension Managed where Self: NSManagedObject {
    
    static var entityName: String {
        return entity().name!
    }
    
    static func fetch(
        in context: NSManagedObjectContext,
        with sortDescriptor: [NSSortDescriptor] = defaultSortDescriptors,
        cofigurationBlock: (NSFetchRequest<Self>) -> Void = { _ in }
    ) -> [Self] {
        let request = NSFetchRequest<Self>(entityName: Self.entityName)
        request.sortDescriptors = sortDescriptor
        cofigurationBlock(request)
        return (try? context.fetch(request)) ?? []
    }
    
    static func findOrFetch(
        in context: NSManagedObjectContext,
        predicate: NSPredicate
    ) -> Self? {
        guard let object = materializedObject(in: context, matching: predicate) else {
            return fetch(in: context) { request in
                request.predicate = predicate
                request.returnsObjectsAsFaults = false
                request.fetchLimit = 1
            }.first
        }
        
        return object
    }
    
    static func materializedObject(in context: NSManagedObjectContext, matching predicate: NSPredicate) -> Self? {
        for object in context.registeredObjects where !object.isFault {
            guard let result = object as? Self, predicate.evaluate(with: result) else { continue }
            
            return result
        }
        
        return nil
    }
}
