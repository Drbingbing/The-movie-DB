//
//  UserRepository.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/8/8.
//

import Foundation

final class UserRepository: UserRepositoryProtocol {
    
    private let localRepository: UserLocalRepositoryProtocol
    
    init(localRepository: UserLocalRepositoryProtocol) {
        self.localRepository = localRepository
    }
    
    func saveUser(_ user: User) {
        localRepository.saveUser(user)
    }
    
    func find(by id: Int) -> User? {
        localRepository.find(by: id)
    }
}
