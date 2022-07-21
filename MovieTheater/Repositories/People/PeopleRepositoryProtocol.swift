//
//  PeopleRepositoryProtocol.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/20.
//

import Combine

protocol PeopleRepositoryProtocol {
    
    func getPopularPeople(page: Int) -> AnyPublisher<[Person], Error>
    
}
