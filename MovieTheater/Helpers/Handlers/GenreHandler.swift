//
//  GenreHandler.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/8/9.
//

import Foundation

final class GenreHandler: GenreHandlerProtocol {
    
    private var genres: [Genre] = []
    
    func setGenres(_ genres: [Genre]) {
        self.genres = genres
    }
    
    func getGenreName(for genreId: Int) -> String? {
        guard let genre = genres.first(where: { $0.id == genreId }) else {
            return nil
        }
        
        return genre.name
    }
}
