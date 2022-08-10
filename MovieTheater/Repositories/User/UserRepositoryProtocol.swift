//
//  UserRepositoryProtocol.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/8/8.
//

import Foundation

protocol UserRepositoryProtocol {
    
    func saveUser(_ user: User)
    
    func find(by id: Int) -> User?
}
