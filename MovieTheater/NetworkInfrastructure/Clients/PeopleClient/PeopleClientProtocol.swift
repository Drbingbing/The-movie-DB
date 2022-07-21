//
//  PeopleClientProtocol.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/20.
//

import Combine

protocol PeopleClientProtocol {
    
    func getPopularPeople(page: Int) -> AnyPublisher<PeopleResult, Error>
}
