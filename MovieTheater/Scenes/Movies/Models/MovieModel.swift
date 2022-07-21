//
//  NowPlayingMoviesViewModel.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/6.
//

import Foundation

final class MovieModel: Hashable, Equatable {
    
    let id: Int
    
    let title: String
    let releaseDate: String?
    let posterURL: URL?
    let backdropURL: URL?
    let overview: String
    
    init(movie: Movie) {
        self.id = movie.id
        self.title = movie.title
        self.posterURL = movie.posterURL
        self.backdropURL = movie.backdropURL
        self.overview = movie.overview
        self.releaseDate = movie.releaseDate
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func ==(lhs: MovieModel, rhs: MovieModel) -> Bool {
        return lhs.id == rhs.id
    }
}
