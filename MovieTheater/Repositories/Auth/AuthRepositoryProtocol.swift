//
//  AuthRepositoryProtocol.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/26.
//

import Combine
import Foundation

protocol AuthRepositoryProtocol {
    
    func getAuthURL() -> AnyPublisher<URL, Error>
    
    func signInUser() -> AnyPublisher<User, Error>
    
    func currentUserId() -> Int?
}
