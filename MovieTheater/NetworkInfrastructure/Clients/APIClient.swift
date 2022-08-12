//
//  APICleint.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/5.
//

import Combine
import Foundation

protocol APIClient {
    
    var dependency: NetworkDependencyProtocol { get }
    
    func fetch<T: Decodable>(request: URLRequest) -> AnyPublisher<T, APIClientError>
    
}

extension APIClient {
    
    func fetch<T: Decodable>(request: URLRequest) -> AnyPublisher<T, APIClientError> {
        dependency.session
            .dataTaskPublisher(for: request)
            .receive(on: dependency.backgroundScheduler)
            .tryMap { data, res -> Data in
                guard let httpResponse = res as? HTTPURLResponse else {
                    throw APIClientError.nonHTTPResponse(response: res)
                }
                
                if 200 ..< 300 ~= httpResponse.statusCode {
                    return data
                }
                
                throw APIClientError.httpRequestFailed(response: httpResponse, data: data)
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                if error is DecodingError {
                    return APIClientError.decodeError(error: error)
                }
                
                return APIClientError.deserializationError(error: error)
            }
            .receive(on: dependency.mainScheduler)
            .print("API")
            .eraseToAnyPublisher()
    }
    
}

extension APIClient {
    
    var dependency: NetworkDependencyProtocol {
        return DIContainer.shared.resolve()
    }
}
