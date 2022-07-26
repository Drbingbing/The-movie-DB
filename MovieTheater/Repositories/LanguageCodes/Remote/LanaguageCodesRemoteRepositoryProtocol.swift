//
//  LanaguageCodesRemoteRepositoryProtocol.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/26.
//

import Combine

protocol LanaguageCodesRemoteRepositoryProtocol {
    
    func fetchAll() -> AnyPublisher<[LanguageCode], Error>
}
