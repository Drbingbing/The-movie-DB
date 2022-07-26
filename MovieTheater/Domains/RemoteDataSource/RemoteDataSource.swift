//
//  RemoteDataSource.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/5.
//

import Foundation

final class RemoteDataSource: RemoteDataSourceProtocol {
    
    func configurationRepository() -> ConfigurationRepositoryProtocol {
        
        let client = ConfigurationClient()
        
        return ConfigurationRepository(client: client)
    }
    
    func moviesRepository() -> MoviesRepositoryProtocol {
        let client = MoviesClient()
        
        return MovieRepository(client: client)
    }
    
    func tvsRepository() -> TVsRepositoryProtocol {
        let client = TVsClient()
        
        return TVsRepository(client: client)
    }
    
    func peopleRepository() -> PeopleRepositoryProtocol {
        let client = PeopleClient()
        
        return PeopleRepository(client: client)
    }
    
    func genreRepository() -> GenreRemoteRepositoryProtocol {
        let client = GenreClient()
        
        return GenreRemoteRepository(client: client)
    }
    
    func languageCodesRepository() -> LanaguageCodesRemoteRepositoryProtocol {
        let client = LanguageCodesClient()
        
        return LanguageCodesRemoteRepository(client: client)
    }
    
    func configure(apiKey: String, readAccessToken: String) {
        NetworkConfiguration.shared.configuration(apiKey: apiKey, readAccessToken: readAccessToken)
    }
}
