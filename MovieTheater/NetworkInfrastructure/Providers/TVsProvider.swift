//
//  TVsProvider.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/19.
//

import Foundation

enum TVsProvider {
    
    case getOnAirTVs(page: Int)
    
}

extension TVsProvider: Endpoint {
    
    var path: String {
        switch self {
        case .getOnAirTVs:
            return "/3/tv/on_the_air"
        }
    }
    
    var params: [String : Any]? {
        switch self {
        case let .getOnAirTVs(page):
            return ["page": page]
        }
    }
    
    var parameterEncoding: ParameterEndcoding {
        switch self {
        case .getOnAirTVs:
            return .defaultEncoding
        }
    }
    
    var method: HttpMethod {
        switch self {
        case .getOnAirTVs:
            return .get
        }
    }
    
    
}
