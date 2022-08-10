//
//  AuthRepository.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/26.
//

import Combine
import Foundation

final class AuthRepository: AuthRepositoryProtocol {
    
    private let authClient: AuthClientProtocol
    private let accountClient: AccountClientProtocol
    private let authManager: AuthenticationManager
    
    init(
        authClient: AuthClientProtocol,
        accountClient: AccountClientProtocol,
        authManager: AuthenticationManager = .shared
    ) {
        self.authClient = authClient
        self.accountClient = accountClient
        self.authManager = authManager
    }
    
    func getAuthURL() -> AnyPublisher<URL, Error> {
        let readAccessToken = authManager.readAccessToken
        return authClient.getRequestToken(with: readAccessToken)
            .map { [authManager] tokenResult -> String in
                authManager.saveRequestToken(tokenResult.token)
                return tokenResult.token
            }
            .compactMap { token -> URL? in
                let urlString = String(format: Constant.authURLStringPath, token)
                return URL(string: urlString)
            }
            .eraseToAnyPublisher()
    }

    func signInUser() -> AnyPublisher<User, Error> {
        let readAccessToken = authManager.readAccessToken
        
        guard let requestToken = authManager.requestToken else {
            return Result.Publisher(.failure(AuthError.noRequestToken)).eraseToAnyPublisher()
        }
        
        return authClient.getAccessToken(with: readAccessToken, requestToken: requestToken)
            .map(\.accessToken)
            .map { [authManager] token -> String in
                authManager.saveAccessToken(token)
                return token
            }
            .flatMap { [authClient] token in
                authClient.createSessionId(with: token)
            }
            .flatMap { [accountClient, authManager] result in
                accountClient.getAccountDetail(with: result.sessionId)
                    .map { user in
                        authManager.saveCurrentUser(result.sessionId, accountId: user.id)
                        return user
                    }
            }
            .eraseToAnyPublisher()
    }
    
    func currentUserId() -> Int? {
        guard let userId = authManager.currentUserId else { return nil }
        
        return Int(userId)
    }
}

extension AuthRepository {
    
    enum AuthError: Error {
        case noRequestToken
    }
    
    struct Constant {
        static let authURLStringPath = "https://www.themoviedb.org/auth/access?request_token=%@"
    }
}
