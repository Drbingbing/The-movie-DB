//
//  LanguageCodesRepository.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/26.
//

import Combine
import CombineExt

final class LanguageCodesRepository: LanguageCodesRepositoryProtocol {
    
    private let localRepository: LanguageCodesLocalRepositoryProtocol
    private let remoteRepository: LanaguageCodesRemoteRepositoryProtocol
    
    init(
        localRepository: LanguageCodesLocalRepositoryProtocol,
        remoteRepository: LanaguageCodesRemoteRepositoryProtocol
    ) {
        self.localRepository = localRepository
        self.remoteRepository = remoteRepository
    }
    
    func fetchAll() -> AnyPublisher<[LanguageCode], Error> {
        let localCodes = localRepository.findAll()
        
        if !localCodes.isEmpty {
            return Just<[LanguageCode]>(localCodes)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
        
        return self.remoteRepository
            .fetchAll()
            .map { [localRepository] codes in
                localRepository.saveLanguageCodes(codes)
                return codes
            }
            .eraseToAnyPublisher()
    }
    
    func find(by alpha2: String) -> AnyPublisher<LanguageCode, Error> {
        let code = localRepository.find(by: alpha2)
        
        return AnyPublisher<LanguageCode, Error>.create { subsriber in
            if let code = code {
                subsriber.send(code)
                subsriber.send(completion: .finished)
            }
            else {
                subsriber.send(completion: .finished)
            }
            
            return AnyCancellable {}
        }
    }
}
