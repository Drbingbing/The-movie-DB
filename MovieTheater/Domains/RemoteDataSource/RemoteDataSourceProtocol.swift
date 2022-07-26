//
//  RemoteDataSourceProtocol.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/5.
//

import Foundation

protocol RemoteDataSourceProtocol {
    
    func configurationRepository() -> ConfigurationRepositoryProtocol
    
    func moviesRepository() -> MoviesRepositoryProtocol
    
    func tvsRepository() -> TVsRepositoryProtocol
    
    func peopleRepository() -> PeopleRepositoryProtocol
    
    func genreRepository() -> GenreRemoteRepositoryProtocol
    
    func languageCodesRepository() -> LanaguageCodesRemoteRepositoryProtocol
    
    func configure(apiKey: String, readAccessToken: String)
}
