//
//  CDUser+CoreDataProperties.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/8/8.
//
//

import Foundation
import CoreData


extension CDUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDUser> {
        return NSFetchRequest<CDUser>(entityName: "CDUser")
    }

    @NSManaged public var name: String
    @NSManaged public var id: Int
    @NSManaged public var username: String
    @NSManaged public var includeAdult: Bool
}
