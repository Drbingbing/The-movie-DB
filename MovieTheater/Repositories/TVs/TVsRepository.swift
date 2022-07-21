//
//  TVsRepository.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/19.
//

import Combine

final class TVsRepository: TVsRepositoryProtocol {
    
    let client: TVsClientProtocol
    
    init(client: TVsClientProtocol) {
        self.client = client
    }
    
    func getOnAirTvShows(page: Int) -> AnyPublisher<[TvShow], Error> {
        client.getOnAirTvShows(page: page)
            .map(\.results)
            .eraseToAnyPublisher()
    }
    
    func getAiringTodayTvShows(page: Int) -> AnyPublisher<[TvShow], Error> {
        client.getAiringTodayTvShows(page: page)
            .map(\.results)
            .eraseToAnyPublisher()
    }
    
    func getPopularTvShows(page: Int) -> AnyPublisher<[TvShow], Error> {
        client.getPopularTvShows(page: page)
            .map(\.results)
            .eraseToAnyPublisher()
    }
    
    func getTopRatedTvShows(page: Int) -> AnyPublisher<[TvShow], Error> {
        client.getTopRatedTvShows(page: page)
            .map(\.results)
            .eraseToAnyPublisher()
    }
}
