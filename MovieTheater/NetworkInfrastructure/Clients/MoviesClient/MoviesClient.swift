//
//  MoviesClient.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/6.
//

import Foundation
import Combine

final class MoviesClient: APIClient, MoviesClientProtocol {
    
    func getNowPlayingMovies(page: Int) -> AnyPublisher<MovieResult, Error> {
        let request = MoviesProvider.getNowPlayingMovies(page: page).request
        
        return fetch(request: request)
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
    
    func getPopularMovies(page: Int) -> AnyPublisher<MovieResult, Error> {
        let request = MoviesProvider.getPopularMovies(page: page).request
        
        return fetch(request: request)
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
    
    func getUpcomingMovies(page: Int) -> AnyPublisher<MovieResult, Error> {
        let request = MoviesProvider.getUpcomingMovies(page: page).request
        
        return fetch(request: request)
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
}
