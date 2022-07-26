//
//  CDLanguageCode+CoreDataClass.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/26.
//
//

import Foundation
import CoreData

@objc(CDLanguageCode)
public class CDLanguageCode: NSManagedObject {

    static func insert(into context: NSManagedObjectContext, name: String, alpha2: String) -> CDLanguageCode {
        let code: CDLanguageCode = context.inserObject()
        code.alpha2 = alpha2
        code.name = name
        return code
    }
}

extension CDLanguageCode: Managed {
    
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return [NSSortDescriptor(key: #keyPath(name), ascending: true)]
    }
}

extension CDLanguageCode: DomainConvertible {
    
    func asDomain() -> LanguageCode {
        return LanguageCode(name: name, alpha2: alpha2)
    }
}
