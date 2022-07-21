//
//  ConfigurationRepository.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/5.
//

import Combine

final class ConfigurationRepository: ConfigurationRepositoryProtocol {
    
    let client: ConfigurationClientProtocol
    
    init(client: ConfigurationClientProtocol) {
        self.client = client
    }
    
    func getAppConfiguration() -> AnyPublisher<Configuration?, Error> {
        return client.getConfiguration()
            .map { result -> Configuration in
                let imageConfiguration = result.images
                let sortConfiguration = SortConfiguration(movieSortKeys: result.sortKeys)
                
                return Configuration(imageConfiguration: imageConfiguration, sortConfiguration: sortConfiguration)
            }
            .eraseToAnyPublisher()
    }
}
