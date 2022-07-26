//
//  CDGenre+CoreDataClass.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/22.
//
//

import Foundation
import CoreData


public class CDGenre: NSManagedObject {
    
    static func insert(into context: NSManagedObjectContext, id: Int, name: String) -> CDGenre {
        let genre: CDGenre = context.inserObject()
        genre.id = id
        genre.name = name
        return genre
    }
}

extension CDGenre: Managed {
    
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return [NSSortDescriptor(key: #keyPath(name), ascending: true)]
    }
}

extension CDGenre: DomainConvertible {
    
    func asDomain() -> Genre {
        return Genre(id: id, name: name)
    }
}
