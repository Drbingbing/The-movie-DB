//
//  AccountClient.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/27.
//

import Foundation
import Combine

final class AccountClient: AccountClientProtocol, APIClient {
    
    func getAccountDetail(with sessionId: String) -> AnyPublisher<User, Error> {
        let request = AccountProvider.getAccountDetail(sessionId: sessionId).request
        
        return fetch(request: request)
            .mapError(\.asError)
            .eraseToAnyPublisher()
    }
}
