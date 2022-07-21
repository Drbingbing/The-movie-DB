//
//  TVsClient.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/19.
//

import Combine

final class TVsClient: TVsClientProtocol, APIClient {
    
    func getOnAirTvShows(page: Int) -> AnyPublisher<TvShowsResult, Error> {
        let request = TvShowsProvider.getOnAirTvShows(page: page).request
        
        return fetch(request: request)
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
    
    func getAiringTodayTvShows(page: Int) -> AnyPublisher<TvShowsResult, Error> {
        let request = TvShowsProvider.getAiringTodayTvShows(page: page).request
        
        return fetch(request: request)
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
    
    func getTopRatedTvShows(page: Int) -> AnyPublisher<TvShowsResult, Error> {
        let request = TvShowsProvider.getTopRatedTvShows(page: page).request
        
        return fetch(request: request)
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
    
    func getPopularTvShows(page: Int) -> AnyPublisher<TvShowsResult, Error> {
        let request = TvShowsProvider.getPopularTvShows(page: page).request
        
        return fetch(request: request)
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
}
