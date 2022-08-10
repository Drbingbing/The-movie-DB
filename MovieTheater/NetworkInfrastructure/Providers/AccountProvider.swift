//
//  AccountProvider.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/27.
//

import Foundation

enum AccountProvider {
    case getAccountDetail(sessionId: String)
}

extension AccountProvider: TMDBEndpoint {
    
    var path: String {
        switch self {
        case .getAccountDetail:
            return "/3/account"
        }
    }
    
    var params: [String : Any]? {
        switch self {
        case .getAccountDetail(let sessionId):
            return ["session_id": sessionId]
        }
    }
    
    var method: HttpMethod {
        switch self {
        case .getAccountDetail:
            return .get
        }
    }
    
    var parameterEncoding: ParameterEndcoding {
        switch self {
        case .getAccountDetail:
            return .defaultEncoding
        }
    }
}
