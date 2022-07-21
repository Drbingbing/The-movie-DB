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
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
}
