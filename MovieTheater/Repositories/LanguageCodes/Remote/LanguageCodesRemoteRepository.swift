//
//  LanguageCodesRemoteRepository.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/26.
//

import Combine

final class LanguageCodesRemoteRepository: LanaguageCodesRemoteRepositoryProtocol {
    
    let client: LanguageCodesClientProtocol
    
    init(client: LanguageCodesClientProtocol) {
        self.client = client
    }
    
    func fetchAll() -> AnyPublisher<[LanguageCode], Error> {
        client.getLanguageCodes()
    }
}
