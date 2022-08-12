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
            .mapError(\.asError)
            .eraseToAnyPublisher()
    }
    
    func getPopularMovies(page: Int) -> AnyPublisher<MovieResult, Error> {
        let request = MoviesProvider.getPopularMovies(page: page).request
        
        return fetch(request: request)
            .mapError(\.asError)
            .eraseToAnyPublisher()
    }
    
    func getUpcomingMovies(page: Int) -> AnyPublisher<MovieResult, Error> {
        let request = MoviesProvider.getUpcomingMovies(page: page).request
        
        return fetch(request: request)
            .mapError(\.asError)
            .eraseToAnyPublisher()
    }
    
    func getMovieDetail(_ id: Int) -> AnyPublisher<Movie, Error> {
        let request = MoviesProvider.getMovieDetail(id: id).request
        
        return fetch(request: request)
            .mapError(\.asError)
            .eraseToAnyPublisher()
    }
    
    func getMovieCredits(_ id: Int) -> AnyPublisher<ActorCreditResult, Error> {
        let request = MoviesProvider.getMovieCredits(id: id).request
        
        return fetch(request: request)
            .mapError(\.asError)
            .eraseToAnyPublisher()
    }
    
    func getSimilarMovies(_ id: Int, page: Int) -> AnyPublisher<MovieResult, Error> {
        let request = MoviesProvider.getSimilarMovies(page: page, id: id).request
        
        return fetch(request: request)
            .mapError(\.asError)
            .eraseToAnyPublisher()
    }
}
