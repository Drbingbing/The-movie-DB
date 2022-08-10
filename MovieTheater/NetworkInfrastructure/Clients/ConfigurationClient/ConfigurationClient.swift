//
//  ConfigurationClient.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/5.
//

import Combine


final class ConfigurationClient: APIClient, ConfigurationClientProtocol {
    
    func getConfiguration() -> AnyPublisher<ConfigurationResult, Error> {
        let request = ConfigurationProvider.getAPIConfiguration.request
        
        return fetch(request: request)
            .mapError(\.asError)
            .eraseToAnyPublisher()
    }
}
