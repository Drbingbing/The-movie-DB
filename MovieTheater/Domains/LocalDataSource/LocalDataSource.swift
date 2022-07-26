//
//  LocalDataSource.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/22.
//

import Foundation

final class LocalDataSource: LocalDataSourceProtocol {
    
    private let coreDataStack: CoreDataStackProtocol
    
    init(appGroupExtensions: [String] = []) {
        self.coreDataStack = CoreDataStack()
        self.coreDataStack.setExtensionPersistentStoreDescriptions(appGroupExtensions)
    }
    
    func genreRepository() -> GenreLocalRepositoryProtocol {
        let store: PersistenceStore<CDGenre> = PersistenceStore(self.coreDataStack.persistentContainer)
        return GenreLocalRepository(store: store)
    }
}
