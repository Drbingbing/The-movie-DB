//
//  DataSourceAssembly.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/7/5.
//

import Foundation
import Swinject

final class DataSourceAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(NetworkDependencyProtocol.self) { _ in
            NetworkDependency()
        }
        
        container.register(LocalDataSourceProtocol.self) { _ in
            return LocalDataSource(appGroupExtensions: AppGroup.allCaseIdentifiers)
        }
        .inObjectScope(.container)
        
        container.register(RemoteDataSourceProtocol.self) { _ in
            return RemoteDataSource()
        }
        .inObjectScope(.container)
        
        container.register(GenreRepositoryProtocol.self) { resolver in
            guard let remoteDataSource = resolver.resolve(RemoteDataSourceProtocol.self) else {
                fatalError("RemoteDataSourceProtocol dependency could not resolved")
            }
            
            guard let localDataSource = resolver.resolve(LocalDataSourceProtocol.self) else {
                fatalError("LocalDataSourceProtocol dependency could not resolved")
            }
            
            let local = localDataSource.genreRepository()
            let remote = remoteDataSource.genreRepository()
            
            return GenreRepository(localRepository: local, remoteRepository: remote)
        }
        .inObjectScope(.container)
        
        container.register(LanguageCodesRepositoryProtocol.self) { resolver in
            guard let remoteDataSource = resolver.resolve(RemoteDataSourceProtocol.self) else {
                fatalError("RemoteDataSourceProtocol dependency could not resolved")
            }
            
            guard let localDataSource = resolver.resolve(LocalDataSourceProtocol.self) else {
                fatalError("LocalDataSourceProtocol dependency could not resolved")
            }
            
            let local = localDataSource.languageCodesRepository()
            let remote = remoteDataSource.languageCodesRepository()
            
            return LanguageCodesRepository(localRepository: local, remoteRepository: remote)
        }
    }
}
