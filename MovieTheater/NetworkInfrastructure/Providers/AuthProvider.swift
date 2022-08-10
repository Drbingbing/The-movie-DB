//
//  AuthProvider.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/26.
//

import Foundation

enum AuthProvider {
    
    case getRequestToken(readAccessToken: String)
    case getAccessToken(readAccessToken: String, requestToken: String)
    case createSessionId(accessToken: String)
}

extension AuthProvider: TMDBEndpoint {
    
    var path: String {
        switch self {
        case .getRequestToken:
            return "/4/auth/request_token"
        case .getAccessToken:
            return "/4/auth/access_token"
        case .createSessionId:
            return "/3/authentication/session/convert/4"
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getRequestToken(let readAccessToken):
            return ["Authorization": "Bearer \(readAccessToken)"]
        case let .getAccessToken(readAccessToken, _):
            return ["Authorization": "Bearer \(readAccessToken)"]
        case .createSessionId:
            return nil
        }
    }
    
    var params: [String : Any]? {
        switch self {
        case .getRequestToken:
            return nil
        case let .getAccessToken(_, requestToken):
            return ["request_token": requestToken]
        case let .createSessionId(accessToken):
            return ["access_token": accessToken]
        }
    }
    
    var parameterEncoding: ParameterEndcoding {
        switch self {
        case .getRequestToken:
            return .defaultEncoding
        case .getAccessToken, .createSessionId:
            return .jsonEndcoding
        }
    }
    
    var method: HttpMethod {
        switch self {
        case .getRequestToken, .getAccessToken, .createSessionId:
            return .post
        }
    }
}
