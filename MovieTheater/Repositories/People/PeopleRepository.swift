//
//  PeopleRepository.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/20.
//

import Foundation
import Combine

final class PeopleRepository: PeopleRepositoryProtocol {
    
    let client: PeopleClientProtocol
    
    init(client: PeopleClientProtocol) {
        self.client = client
    }
    
    func getPopularPeople(page: Int) -> AnyPublisher<[Person], Error> {
        client.getPopularPeople(page: page)
            .map(\.results)
            .eraseToAnyPublisher()
    }
    
    func getPersonDetail(_ id: Int) -> AnyPublisher<Person, Error> {
        client.getPersonDetail(id)
            .eraseToAnyPublisher()
    }
    
    func getMovieCredit(_ id: Int) -> AnyPublisher<[Movie], Error> {
        client.getMovieCredits(id)
            .map(\.cast)
            .eraseToAnyPublisher()
    }
    
    func getExternalIDs(_ id: Int) -> AnyPublisher<ExternalID, Error> {
        client.getExternalIDs(id)
            .eraseToAnyPublisher()
    }
}
