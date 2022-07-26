//
//  CoreDataStackProtocol.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/22.
//

import CoreData

protocol CoreDataStackProtocol {
    
    var persistentContainer: NSPersistentContainer { get }
    
    func setExtensionPersistentStoreDescriptions(_ groupExtensionIds: [String])
}
