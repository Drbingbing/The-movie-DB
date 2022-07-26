//
//  GenreClient.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/22.
//

import Combine

final class GenreClient: GenreClientProtocol, APIClient {
    
    func getAllGenres() -> AnyPublisher<GenreResult, Error> {
        let request = GenreProvider.getAll.request
        
        return fetch(request: request)
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
}
