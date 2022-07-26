//
//  GenreRepositoryProtocol.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/22.
//

import Combine

protocol GenreRemoteRepositoryProtocol {
    
    func fetchAll() -> AnyPublisher<[Genre], Error>
}
