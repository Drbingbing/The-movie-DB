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
    
    func getOnAirTVs(page: Int) -> AnyPublisher<[TV], Error> {
        client.getOnAirTvs(page: page)
            .map(\.results)
            .eraseToAnyPublisher()
    }
}
