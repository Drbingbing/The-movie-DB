//
//  TVsClientProtocol.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/19.
//

import Combine

protocol TVsClientProtocol {
    
    func getOnAirTvShows(page: Int) -> AnyPublisher<TvShowsResult, Error>
    
    func getAiringTodayTvShows(page: Int) -> AnyPublisher<TvShowsResult, Error>
    
    func getTopRatedTvShows(page: Int) -> AnyPublisher<TvShowsResult, Error>
    
    func getPopularTvShows(page: Int) -> AnyPublisher<TvShowsResult, Error>
}
