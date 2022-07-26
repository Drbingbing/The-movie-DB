//
//  ConfigurationProvider.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/5.
//

import Foundation

enum ConfigurationProvider {
    
    case getAPIConfiguration
    
}

extension ConfigurationProvider: TMDBEndpoint {
    
    var path: String {
        switch self {
        case .getAPIConfiguration:
            return "/3/configuration"
        }
    }
    
    var params: [String : Any]? {
        return nil
    }
    
    var method: HttpMethod {
        switch self {
        case .getAPIConfiguration:
            return .get
        }
    }
    
    var parameterEncoding: ParameterEndcoding {
        return .defaultEncoding
    }
    
}
