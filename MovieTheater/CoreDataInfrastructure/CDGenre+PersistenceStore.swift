//
//  CDGenre+PersistenceStore.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/22.
//

import Foundation

extension PersistenceStore where Entity == CDGenre {
    
    func saveGenre(_ genre: Genre) {
        managedObjectContext.performChanges {
            _ = CDGenre.insert(
                into: self.managedObjectContext,
                id: genre.id,
                name: genre.name
            )
        }
    }
    
    func find(by id: Int) -> CDGenre? {
        let predicate = NSPredicate(format: "id == %d", id)
        return CDGenre.findOrFetch(in: managedObjectContext, predicate: predicate)
    }
    
    func findAll() -> [CDGenre] {
        return CDGenre.fetch(in: managedObjectContext)
    }
}
