//
//  GenreClientProtocol.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/22.
//

import Combine

protocol GenreClientProtocol {
    
    func getAllGenres() -> AnyPublisher<GenreResult, Error>
}
