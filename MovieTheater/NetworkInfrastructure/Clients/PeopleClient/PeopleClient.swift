//
//  PeopleClient.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/20.
//

import Combine

final class PeopleClient: APIClient, PeopleClientProtocol {
    
    func getPopularPeople(page: Int) -> AnyPublisher<PeopleResult, Error> {
        let request = PeopleProvider.getPopularPeople(page: page).request
        
        return fetch(request: request)
            .mapError(\.asError)
            .eraseToAnyPublisher()
    }
    
    func getPersonDetail(_ id: Int) -> AnyPublisher<Person, Error> {
        let request = PeopleProvider.getPersonDetail(id: id).request
        
        return fetch(request: request)
            .mapError(\.asError)
            .eraseToAnyPublisher()
    }
    
    func getMovieCredits(_ id: Int) -> AnyPublisher<MovieCreditResult, Error> {
        let request = PeopleProvider.getMovieCredit(id: id).request
        
        return fetch(request: request)
            .mapError(\.asError)
            .eraseToAnyPublisher()
    }
    
    func getExternalIDs(_ id: Int) -> AnyPublisher<ExternalIDResult, Error> {
        let request = PeopleProvider.getExternalIDs(id: id).request
        
        return fetch(request: request)
            .mapError(\.asError)
            .eraseToAnyPublisher()
    }
}
