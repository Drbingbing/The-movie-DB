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
}
