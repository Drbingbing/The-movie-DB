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
    
    func getMovieDetail(_ id: Int) -> AnyPublisher<Movie, Error> {
        client.getMovieDetail(id)
    }
    
    func getMovieCredits(_ id: Int) -> AnyPublisher<[Actor], Error> {
        client.getMovieCredits(id)
            .map(\.cast)
            .eraseToAnyPublisher()
    }
    
    func getSimilarMovies(_ id: Int, page: Int) -> AnyPublisher<[Movie], Error> {
        client.getSimilarMovies(id, page: page)
            .map(\.result)
            .eraseToAnyPublisher()
    }
}
