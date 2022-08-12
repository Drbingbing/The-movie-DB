//
//  PeopleRepositoryProtocol.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/20.
//

import Combine

protocol PeopleRepositoryProtocol {
    
    func getPopularPeople(page: Int) -> AnyPublisher<[Person], Error>
    
    func getPersonDetail(_ id: Int) -> AnyPublisher<Person, Error>
    
    func getMovieCredit(_ id: Int) -> AnyPublisher<[Movie], Error>
    
    func getExternalIDs(_ id: Int) -> AnyPublisher<ExternalID, Error>
}
