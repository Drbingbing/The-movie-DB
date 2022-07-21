//
//  MoviesRepository.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/6.
//

import Foundation
import Combine

final class MovieRepository: MoviesRepositoryProtocol {
    
    let client: MoviesClientProtocol
    
    init(client: MoviesClientProtocol) {
        self.client = client
    }
    
    func getNowPlayingMovies(page: Int) -> AnyPublisher<[Movie], Error> {
        client.getNowPlayingMovies(page: page)
            .map(\.result)
            .eraseToAnyPublisher()
    }
    
    func getPopularMovies(page: Int) -> AnyPublisher<[Movie], Error> {
        client.getPopularMovies(page: page)
            .map(\.result)
            .eraseToAnyPublisher()
    }
    
    func getUpcomingMovies(page: Int) -> AnyPublisher<[Movie], Error> {
        client.getUpcomingMovies(page: page)
            .map(\.result)
            .eraseToAnyPublisher()
    }
}
