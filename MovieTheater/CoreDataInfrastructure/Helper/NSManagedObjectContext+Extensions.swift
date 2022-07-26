//
//  NSManagedObjectContext+Extensions.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/22.
//

import Foundation
import CoreData

extension NSManagedObjectContext {
    
    func inserObject<A: NSManagedObject>() -> A where A: Managed {
        guard let obj = NSEntityDescription.insertNewObject(forEntityName: A.entityName, into: self) as? A else {
            fatalError("Wrong object type")
        }
        
        return obj
    }
    
    @discardableResult
    func saveOrRollback() -> Bool {
        do {
            try save()
            return true
        } catch {
            rollback()
            return false
        }
    }
    
    func performChanges(block: @escaping () -> Void) {
        perform {
            block()
            self.saveOrRollback()
        }
    }
}
