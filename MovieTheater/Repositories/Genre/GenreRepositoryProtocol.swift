//
//  GenreRepositoryProtocol.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/22.
//

import Combine

protocol GenreRepositoryProtocol {
    
    func find(with id: Int) -> AnyPublisher<Genre, Error>
    func fetchAll() -> AnyPublisher<[Genre], Error>
}
