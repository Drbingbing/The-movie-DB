//
//  LocalDataSourceProtocol.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/22.
//

import Foundation

protocol LocalDataSourceProtocol {
    
    func genreRepository() -> GenreLocalRepositoryProtocol
    
    func languageCodesRepository() -> LanguageCodesLocalRepositoryProtocol
}
