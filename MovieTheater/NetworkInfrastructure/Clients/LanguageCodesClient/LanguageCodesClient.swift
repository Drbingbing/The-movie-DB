//
//  LanguageCodesClient.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/26.
//

import Combine

final class LanguageCodesClient: APIClient, LanguageCodesClientProtocol {
    
    func getLanguageCodes() -> AnyPublisher<[LanguageCode], Error> {
        let request = LanguageCodesProvider.getLanguageCodes.request
        
        return fetch(request: request)
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
}
