//
//  LanguageCodesClientProtocol.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/26.
//

import Combine

protocol LanguageCodesClientProtocol {
    
    func getLanguageCodes() -> AnyPublisher<[LanguageCode], Error>
}
