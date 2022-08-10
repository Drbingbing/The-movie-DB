//
//  UserLocalRepository.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/8/8.
//

import Foundation

final class UserLocalRepository: UserLocalRepositoryProtocol {
    
    private let store: PersistenceStore<CDUser>
    
    init(store: PersistenceStore<CDUser>) {
        self.store = store
    }
    
    func saveUser(_ user: User) {
        store.saveUser(user)
    }
    
    func find(by id: Int) -> User? {
        store.find(by: id)?.asDomain()
    }
}
