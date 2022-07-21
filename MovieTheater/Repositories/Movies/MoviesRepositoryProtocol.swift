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
}
