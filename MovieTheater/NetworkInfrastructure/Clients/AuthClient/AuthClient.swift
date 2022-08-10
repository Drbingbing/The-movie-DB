//
//  AuthClient.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/26.
//

import Combine

final class AuthClient: APIClient, AuthClientProtocol {
    
    func getRequestToken(with readAccessToken: String) -> AnyPublisher<RequestTokenResult, Error> {
        let request = AuthProvider.getRequestToken(readAccessToken: readAccessToken).request
        
        return fetch(request: request)
            .mapError(\.asError)
            .eraseToAnyPublisher()
    }
    
    func getAccessToken(with readAccessToken: String, requestToken: String) -> AnyPublisher<AccessTokenResult, Error> {
        let request = AuthProvider.getAccessToken(readAccessToken: readAccessToken, requestToken: requestToken).request
        
        return fetch(request: request)
            .mapError(\.asError)
            .eraseToAnyPublisher()
    }
    
    func createSessionId(with accessToken: String) -> AnyPublisher<SessionResult, Error> {
        let request = AuthProvider.createSessionId(accessToken: accessToken).request
        
        return fetch(request: request)
            .mapError(\.asError)
            .eraseToAnyPublisher()
    }
}
