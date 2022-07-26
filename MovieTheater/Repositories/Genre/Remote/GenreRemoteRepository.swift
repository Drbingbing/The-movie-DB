//
//  GenreRemoteRepository.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/22.
//

import Combine

final class GenreRemoteRepository: GenreRemoteRepositoryProtocol {
    
    let client: GenreClientProtocol
    
    init(client: GenreClientProtocol) {
        self.client = client
    }
    
    func fetchAll() -> AnyPublisher<[Genre], Error> {
        client.getAllGenres()
            .map(\.genres)
            .eraseToAnyPublisher()
    }
}
