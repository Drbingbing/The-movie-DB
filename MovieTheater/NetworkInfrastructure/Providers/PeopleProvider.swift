//
//  PeopleProvider.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/20.
//

import Foundation

enum PeopleProvider {
    
    case getPopularPeople(page: Int)
}


extension PeopleProvider: TMDBEndpoint {
    
    var path: String {
        switch self {
        case .getPopularPeople:
            return "/3/person/popular"
        }
    }
    
    var params: [String : Any]? {
        switch self {
        case let .getPopularPeople(page):
            return ["page": page]
        }
    }
    
    var method: HttpMethod {
        switch self {
        case .getPopularPeople:
            return .get
        }
    }
    
    
    var parameterEncoding: ParameterEndcoding {
        switch self {
        case .getPopularPeople:
            return .defaultEncoding
        }
    }
}
