//
//  Entities+GenreName.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/8/9.
//

import Foundation

protocol GenreNameable {
    
    var genreId: Int? { get }
    var genreName: String { get }
}

extension GenreNameable {
    
    var genreHandler: GenreHandlerProtocol {
        DIContainer.shared.resolve()
    }
    
    var genreName: String {
        guard let genreId = genreId,
              let genreName = genreHandler.getGenreName(for: genreId) else {
            return "-"
        }
        
        return genreName
    }
}

extension Movie: GenreNameable {
    
    var genreId: Int? {
        return genreIDs?.first
    }
}
