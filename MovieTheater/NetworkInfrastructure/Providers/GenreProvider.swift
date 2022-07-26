//
//  GenreProvider.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/22.
//

import Foundation

enum GenreProvider {
    
    case getAll
}

extension GenreProvider: TMDBEndpoint {
    
    var path: String {
        switch self {
        case .getAll:
            return "/3/genre/movie/list"
        }
    }
    
    var method: HttpMethod {
        switch self {
        case .getAll:
            return .get
        }
    }
    
    var parameterEncoding: ParameterEndcoding {
        switch self {
        case .getAll:
            return .defaultEncoding
        }
    }
    
    var params: [String : Any]? {
        switch self {
        case .getAll:
            return nil
        }
    }
}
