//
//  CDUser+PersistenceStore.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/8/8.
//

import Foundation

extension PersistenceStore where Entity == CDUser {
    
    func find(by id: Int) -> CDUser? {
        let predicate = NSPredicate(format: "id == %d", id)
        return CDUser.findOrFetch(in: managedObjectContext, predicate: predicate)
    }
    
    func saveUser(_ user: User) {
        managedObjectContext.performChanges {
            _ = CDUser.insert(into: self.managedObjectContext,
                              id: user.id,
                              name: user.name,
                              username: user.userName)
        }
    }
}
