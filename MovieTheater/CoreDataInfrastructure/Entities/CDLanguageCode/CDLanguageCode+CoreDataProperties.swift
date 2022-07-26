//
//  CDLanguageCode+CoreDataProperties.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/26.
//
//

import Foundation
import CoreData


extension CDLanguageCode {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDLanguageCode> {
        return NSFetchRequest<CDLanguageCode>(entityName: "CDLanguageCode")
    }

    @NSManaged public var name: String
    @NSManaged public var alpha2: String

}
