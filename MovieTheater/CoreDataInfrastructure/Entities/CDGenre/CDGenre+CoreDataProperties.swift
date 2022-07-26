//
//  CDGenre+CoreDataProperties.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/22.
//
//

import Foundation
import CoreData


extension CDGenre {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDGenre> {
        return NSFetchRequest<CDGenre>(entityName: "CDGenre")
    }

    @NSManaged public var id: Int
    @NSManaged public var name: String

}

extension CDGenre : Identifiable {

}
