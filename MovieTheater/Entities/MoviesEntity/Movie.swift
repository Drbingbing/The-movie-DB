//
//  Movie.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/6.
//

import Foundation

struct Movie: Decodable, Equatable {
    
    let id: Int
    let overview: String
    let releaseDate: String
    let genreIDs: [Int]
    let title: String
    let backdropPath: String?
    let posterPath: String?
    let popularity: Double
    let adult: Bool
    let voteAverage: Double
    let voteCount: Int
    let video: Bool
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case overview = "overview"
        case releaseDate = "release_date"
        case genreIDs = "genre_ids"
        case title = "title"
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
        case popularity = "popularity"
        case voteCount = "vote_count"
        case video = "video"
        case voteAverage = "vote_average"
        case adult = "adult"
    }
}
