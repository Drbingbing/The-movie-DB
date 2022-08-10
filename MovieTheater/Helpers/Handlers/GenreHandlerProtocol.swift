//
//  GenreHandlerProtocol.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/8/9.
//

import Foundation

protocol GenreHandlerProtocol {
    
    func setGenres(_ genres: [Genre])
    func getGenreName(for genreId: Int) -> String?
}
