//
//  TVsClient.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/19.
//

import Combine

final class TVsClient: TVsClientProtocol, APIClient {
    
    func getOnAirTvs(page: Int) -> AnyPublisher<TVsResult, Error> {
        let request = TVsProvider.getOnAirTVs(page: page).request
        
        return fetch(request: request)
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
}
