//
//  MoviesClientProtocol.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/6.
//

import Combine

protocol MoviesClientProtocol {
    
    func getNowPlayingMovies(page: Int) -> AnyPublisher<MovieResult, Error>
    
    func getPopularMovies(page: Int) -> AnyPublisher<MovieResult, Error>
    
    func getUpcomingMovies(page: Int) -> AnyPublisher<MovieResult, Error>
    
    func getMovieDetail(_ id: Int) -> AnyPublisher<Movie, Error>
    
    func getMovieCredits(_ id: Int) -> AnyPublisher<CreditsResult, Error>
    
    func getSimilarMovies(_ id: Int, page: Int) -> AnyPublisher<MovieResult, Error>
}
