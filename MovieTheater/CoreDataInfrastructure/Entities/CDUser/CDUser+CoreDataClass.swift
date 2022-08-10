//
//  CDUser+CoreDataClass.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/8/8.
//
//

import Foundation
import CoreData


public class CDUser: NSManagedObject {

    static func insert(
        into context: NSManagedObjectContext,
        id: Int,
        name: String,
        username: String
    ) -> CDUser {
        let user: CDUser = context.inserObject()
        user.id = id
        user.name = name
        user.username = username
        
        return user
    }
}

extension CDUser: DomainConvertible {
    
    func asDomain() -> User {
        User(name: name, id: id, userName: username, includeAdult: includeAdult)
    }
}

extension CDUser: Managed {
    
}
