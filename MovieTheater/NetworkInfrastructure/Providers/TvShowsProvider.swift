//
//  TVsProvider.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/19.
//

import Foundation

enum TvShowsProvider {
    
    case getOnAirTvShows(page: Int)
    
    case getAiringTodayTvShows(page: Int)
    
    case getPopularTvShows(page: Int)
    
    case getTopRatedTvShows(page: Int)
}

extension TvShowsProvider: TMDBEndpoint {
    
    var path: String {
        switch self {
        case .getOnAirTvShows:
            return "/3/tv/on_the_air"
        case .getAiringTodayTvShows:
            return "/3/tv/airing_today"
        case .getPopularTvShows:
            return "/3/tv/popular"
        case .getTopRatedTvShows:
            return "/3/tv/top_rated"
        }
    }
    
    var params: [String : Any]? {
        switch self {
        case let .getOnAirTvShows(page):
            return ["page": page]
        case let .getAiringTodayTvShows(page):
            return ["page": page]
        case let .getPopularTvShows(page):
            return ["page": page]
        case let .getTopRatedTvShows(page):
            return ["page": page]
        }
    }
    
    var parameterEncoding: ParameterEndcoding {
        switch self {
        case .getOnAirTvShows, .getAiringTodayTvShows, .getPopularTvShows, .getTopRatedTvShows:
            return .defaultEncoding
        }
    }
    
    var method: HttpMethod {
        switch self {
        case .getOnAirTvShows, .getAiringTodayTvShows, .getPopularTvShows, .getTopRatedTvShows:
            return .get
        }
    }
    
    
}
