//
//  GenreRepository.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/22.
//

import CombineExt
import Combine

final class GenreRepository: GenreRepositoryProtocol {
    
    private let localRepository: GenreLocalRepositoryProtocol
    private let remoteRepository: GenreRemoteRepositoryProtocol
    
    init(
        localRepository: GenreLocalRepositoryProtocol,
        remoteRepository: GenreRemoteRepositoryProtocol
    ) {
        self.localRepository = localRepository
        self.remoteRepository = remoteRepository
    }
    
    func find(with id: Int) -> AnyPublisher<Genre, Error> {
        let genre = localRepository.find(by: id)
        
        return AnyPublisher<Genre, Error>.create { subsriber in
            if let genre = genre {
                subsriber.send(genre)
                subsriber.send(completion: .finished)
            }
            else {
                subsriber.send(completion: .finished)
            }
            
            return AnyCancellable {}
        }
    }
    
    func fetchAll() -> AnyPublisher<[Genre], Error> {
        let localGenres = localRepository.findAll()
        if !localGenres.isEmpty {
            return Just<[Genre]>(localGenres)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
        
        return remoteRepository.fetchAll()
            .map { [localRepository] genres in
                localRepository.saveGenres(genres)
                return genres
            }
            .eraseToAnyPublisher()
    }
}
