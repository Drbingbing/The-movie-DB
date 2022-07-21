//
//  ConfigurationClientProtocol.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/5.
//

import Combine

protocol ConfigurationClientProtocol {
    
    func getConfiguration() -> AnyPublisher<ConfigurationResult, Error>
}
