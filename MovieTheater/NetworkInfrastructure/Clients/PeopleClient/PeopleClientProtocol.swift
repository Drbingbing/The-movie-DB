//
//  PeopleClientProtocol.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/20.
//

import Combine

protocol PeopleClientProtocol {
    
    func getPopularPeople(page: Int) -> AnyPublisher<PeopleResult, Error>
    
    func getPersonDetail(_ id: Int) -> AnyPublisher<Person, Error>
    
    func getMovieCredits(_ id: Int) -> AnyPublisher<MovieCreditResult, Error>
    
    func getExternalIDs(_ id: Int) -> AnyPublisher<ExternalIDResult, Error>
}
