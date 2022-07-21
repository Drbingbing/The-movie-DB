//
//  ConfigurationRepositoryProtocol.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/5.
//

import Combine

protocol ConfigurationRepositoryProtocol {
    
    func getAppConfiguration() -> AnyPublisher<Configuration?, Error>
    
}
