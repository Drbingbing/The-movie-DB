//
//  TV.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/19.
//

import Foundation

struct TV: Decodable, Equatable {
    
    let id: Int
    let overview: String
    let popularity: Float
    let backdropPath: String?
    let posterPath: String?
    let voteAverage: Float
    let firstAirDate: String
    let name: String
    let voteCount: Int
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case overview = "overview"
        case firstAirDate = "first_air_date"
        case name = "name"
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
        case popularity = "popularity"
        case voteCount = "vote_count"
        case voteAverage = "vote_average"
    }
}
