//
//  LanguageCodesRepositoryProtocol.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/26.
//

import Combine

protocol LanguageCodesRepositoryProtocol {
    
    func fetchAll() -> AnyPublisher<[LanguageCode], Error>
    func find(by alpha2: String) -> AnyPublisher<LanguageCode, Error>
}
