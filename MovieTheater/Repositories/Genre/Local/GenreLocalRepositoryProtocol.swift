//
//  GenreLocalDataSourceProtocol.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/22.
//

import Foundation

protocol GenreLocalRepositoryProtocol {
    
    func saveGenres(_ genres: [Genre])
    
    func find(by id: Int) -> Genre?
    
    func findAll() -> [Genre]
}
