//
//  PeopleProvider.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/20.
//

import Foundation

enum PeopleProvider {
    
    case getPopularPeople(page: Int)
    
    case getPersonDetail(id: Int)
    
    case getMovieCredit(id: Int)
    
    case getExternalIDs(id: Int)
}


extension PeopleProvider: TMDBEndpoint {
    
    var language: String {
        return "en"
    }
    
    var path: String {
        switch self {
        case .getPopularPeople:
            return "/3/person/popular"
        case let .getPersonDetail(id):
            return "/3/person/\(id)"
        case let .getMovieCredit(id):
            return "/3/person/\(id)/movie_credits"
        case let .getExternalIDs(id):
            return "/3/person/\(id)/external_ids"
        }
    }
    
    var params: [String : Any]? {
        switch self {
        case let .getPopularPeople(page):
            return ["page": page]
        case .getPersonDetail, .getMovieCredit, .getExternalIDs:
            return nil
        }
    }
    
    var method: HttpMethod {
        switch self {
        case .getPopularPeople, .getPersonDetail, .getMovieCredit, .getExternalIDs:
            return .get
        }
    }
    
    
    var parameterEncoding: ParameterEndcoding {
        switch self {
        case .getPopularPeople, .getPersonDetail, .getMovieCredit, .getExternalIDs:
            return .defaultEncoding
        }
    }
}
