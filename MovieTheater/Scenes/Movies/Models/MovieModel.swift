//
//  NowPlayingMoviesViewModel.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/6.
//

import Foundation

final class MovieModel: Identifiable, Hashable, Equatable {
    
    let id: UUID
    
    let movieID: Int
    let title: String
    let releaseDate: String?
    let posterURL: URL?
    let backdropURL: URL?
    let overview: String
    let voteAverage: Double
    let genreIDs: [Int]
    let originTitle: String
    let originLanguage: String
    let genreName: String
    let status: String?
    let budget: Int?
    let revenue: Int?
    
    init(movie: Movie) {
        self.id = UUID()
        self.movieID = movie.id
        self.title = movie.title
        self.originTitle = movie.originalTitle
        self.originLanguage = movie.languageName
        self.budget = movie.budget
        self.revenue = movie.revenue
        self.voteAverage = movie.voteAverage
        self.posterURL = movie.posterURL
        self.backdropURL = movie.backdropURL
        self.overview = movie.overview
        self.status = movie.status
        self.releaseDate = movie.releaseDate
        self.genreName = movie.genreName
        self.genreIDs = movie.genreIDs ?? []
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func ==(lhs: MovieModel, rhs: MovieModel) -> Bool {
        return lhs.id == rhs.id
    }
}
