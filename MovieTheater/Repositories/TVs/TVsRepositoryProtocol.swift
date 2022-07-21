//
//  TVsRepositoryProtocol.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/19.
//

import Combine

protocol TVsRepositoryProtocol {
    
    func getOnAirTvShows(page: Int) -> AnyPublisher<[TvShow], Error>
    
    func getAiringTodayTvShows(page: Int) -> AnyPublisher<[TvShow], Error>
    
    func getTopRatedTvShows(page: Int) -> AnyPublisher<[TvShow], Error>
    
    func getPopularTvShows(page: Int) -> AnyPublisher<[TvShow], Error>
}
