//
//  TVsRepositoryProtocol.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/19.
//

import Combine

protocol TVsRepositoryProtocol {
    
    func getOnAirTVs(page: Int) -> AnyPublisher<[TV], Error>
    
}
