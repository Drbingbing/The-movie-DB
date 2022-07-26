//
//  GenreLocalRepository.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/22.
//

import Foundation

final class GenreLocalRepository: GenreLocalRepositoryProtocol {
    
    let store: PersistenceStore<CDGenre>
    
    init(store: PersistenceStore<CDGenre>) {
        self.store = store
    }
    
    func saveGenres(_ genres: [Genre]) {
        genres.forEach { store.saveGenre($0) }
    }
    
    func find(by id: Int) -> Genre? {
        return store.find(by: id)?.asDomain()
    }
    
    func findAll() -> [Genre] {
        return store.findAll().map { $0.asDomain() }
    }
}
