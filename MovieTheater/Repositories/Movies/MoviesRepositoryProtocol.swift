//
//  MoviesRepositoryProtocol.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/6.
//

import Combine

protocol MoviesRepositoryProtocol {
    
    func getNowPlayingMovies(page: Int) -> AnyPublisher<[Movie], Error>
    
    func getPopularMovies(page: Int) -> AnyPublisher<[Movie], Error>
    
    func getUpcomingMovies(page: Int) -> AnyPublisher<[Movie], Error>
    
    func getMovieDetail(_ id: Int) -> AnyPublisher<Movie, Error>
    
    func getMovieCredits(_ id: Int) -> AnyPublisher<[Actor], Error>
    
    func getSimilarMovies(_ id: Int, page: Int) -> AnyPublisher<[Movie], Error>
}
