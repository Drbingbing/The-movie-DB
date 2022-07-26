//
//  AuthProvider.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/26.
//

import Foundation

enum AuthProvider {
    
    case getRequestToken(readAccessToken: String)
}

extension AuthProvider: TMDBEndpoint {
    
    var path: String {
        switch self {
        case .getRequestToken:
            return "/4/auth/request_token"
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getRequestToken(let readAccessToken):
            return ["Authorization": "Bearer \(readAccessToken)"]
        }
    }
    
    var params: [String : Any]? {
        switch self {
        case .getRequestToken:
            return nil
        }
    }
    
    var parameterEncoding: ParameterEndcoding {
        switch self {
        case .getRequestToken:
            return .defaultEncoding
        }
    }
    
    var method: HttpMethod {
        switch self {
        case .getRequestToken:
            return .post
        }
    }
}
