//
//  MoviesProvider.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/6.
//

import Foundation

enum MoviesProvider {
    
    case getNowPlayingMovies(page: Int)
    
    case getPopularMovies(page: Int)
    
    case getUpcomingMovies(page: Int)
    
    case getMovieDetail(id: Int)
    
    case getMovieCredits(id: Int)
}

extension MoviesProvider: Endpoint {
    
    var path: String {
        switch self {
        case .getNowPlayingMovies:
            return "/3/movie/now_playing"
        case .getPopularMovies:
            return "/3/movie/popular"
        case .getUpcomingMovies:
            return "/3/movie/upcoming"
        case let .getMovieDetail(id):
            return "/3/movie/\(id)"
        case let .getMovieCredits(id):
            return "/3/movie/\(id)/credits"
        }
    }
    
    var params: [String : Any]? {
        switch self {
        case let .getNowPlayingMovies(page):
            return ["page": page, "region": "TW"]
        case let .getPopularMovies(page):
            return ["page": page, "region": "TW"]
        case let .getUpcomingMovies(page):
            return ["page": page, "region": "TW"]
        case .getMovieDetail:
            return nil
        case .getMovieCredits:
            return nil
        }
    }
    
    var parameterEncoding: ParameterEndcoding {
        switch self {
        case .getNowPlayingMovies, .getPopularMovies, .getUpcomingMovies, .getMovieDetail, .getMovieCredits:
            return .defaultEncoding
        }
    }
    
    var method: HttpMethod {
        switch self {
        case .getNowPlayingMovies, .getPopularMovies, .getUpcomingMovies, .getMovieDetail, .getMovieCredits:
            return .get
        }
    }
}
