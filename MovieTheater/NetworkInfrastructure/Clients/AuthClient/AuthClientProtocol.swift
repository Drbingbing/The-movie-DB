//
//  AuthClientProtocol.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/26.
//

import Combine

protocol AuthClientProtocol {
    
    func getRequestToken(with readAccessToken: String) -> AnyPublisher<RequestTokenResult, Error>
    
    func getAccessToken(with readAccessToken: String, requestToken: String) -> AnyPublisher<AccessTokenResult, Error>
    
    func createSessionId(with accessToken: String) -> AnyPublisher<SessionResult, Error>
}
