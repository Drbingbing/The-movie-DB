//
//  TVsClientProtocol.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/19.
//

import Combine

protocol TVsClientProtocol {
    
    func getOnAirTvs(page: Int) -> AnyPublisher<TVsResult, Error>
}
